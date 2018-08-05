//
//  PlayerStatViewViewModelTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 03/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
import nrlstats
@testable import nrlstats


class PlayerStatViewViewModelTests: XCTestCase {
    
    var sut: PlayerStatViewViewModel?
    var networkManager: MockNetworkManager?
    var bindingMethodCalled: Bool = false
    var bindingClosure: (() -> Void)?

    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        bindingMethodCalled = false
        bindingClosure =  { self.bindingMethodCalled = true }
    }

    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testLoadCallsGetPlayerHeadshotData_GivenNetworkManager() {
        sut?.load()
        XCTAssert(networkManager!.isGetPlayerImageDataCalled)
    }

    func testImageApiErrorMessage_GivenNetworkManagerCallFails() {
        let errorMessage = "Failed call"
        sut?.load()
        networkManager?.fetchApiFailure(.playerImage, error: errorMessage)
        XCTAssert(sut?.fetchError == errorMessage)
    }

    func testShortNameBindingCalled() {
        sut?.onShortNameChange = bindingClosure
        assertBindingCalled()
    }

    func testJumperNumberBindingCalled() {
        sut?.onJumperNumberChange = bindingClosure
        assertBindingCalled()
    }

    func testPositionBindingCalled() {
        sut?.onPositionChange = bindingClosure
        assertBindingCalled()
    }

    func testStatValueBindingCalled() {
        sut?.onStatValueChange = bindingClosure
        assertBindingCalled()
    }

    func testImageDataBindingCalled() {
        sut?.onImageDataChange = bindingClosure
        sut?.imageData = Data()
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }

    // MARK: Private helpers

    private func assertBindingCalled() {
        sut?.load()
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }
}
