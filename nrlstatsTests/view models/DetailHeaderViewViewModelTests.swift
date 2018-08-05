//
//  DetailHeaderViewViewModelTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 05/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class DetailHeaderViewViewModelTests: XCTestCase {
    
    var sut: DetailHeaderViewViewModel?
    var networkManager: MockNetworkManager?
    var bindingMethodCalled: Bool = false
    var bindingClosure: (() -> Void)?

    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = DetailHeaderViewViewModel(player: Player.mock())
        bindingMethodCalled = false
        bindingClosure =  { self.bindingMethodCalled = true }
    }

    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testImageDataBindingCalled() {
        sut?.onImageDataChange = bindingClosure
        assertBindingCalled()
    }

    func testPositionBindingCalled() {
        sut?.onPositionChange = bindingClosure
        assertBindingCalled()
    }

    func testFullNameBindingCalled() {
        sut?.onFullNameChange = bindingClosure
        assertBindingCalled()
    }

    // MARK: Private helpers

    private func assertBindingCalled() {
        sut?.load()
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }
    
}
