
//
//  DetailedPlayerStatsViewModelTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 05/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class DetailedPlayerStatsViewModelTests: XCTestCase {

    var sut: DetailedPlayerStatsViewModel?
    var networkManager: MockNetworkManager?
    var bindingMethodCalled: Bool = false
    var bindingClosure: (() -> Void)?
    
    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = DetailedPlayerStatsViewModel(player: Player.mock(), networkManager: networkManager!)
        bindingMethodCalled = false
        bindingClosure =  { self.bindingMethodCalled = true }
    }
    
    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testLoadCallsGetPlayerStats() {
        sut?.load()
        XCTAssert(networkManager!.isGetPlayerStatsCalled)
    }

    func testviewModelForHeaderViewNotNil() {
        XCTAssertNotNil(sut?.viewModelForHeaderView())
    }

    func testNumberOfSections() {
       XCTAssert(sut?.numberOfSections == 1)
    }

    func testNumberOfRowsInSection_GivenNoStats() {
        XCTAssert(sut?.numberOfRowsInSection(section: 0) == 0)
    }

    func testImageDataBindingCalled() {
        sut?.onImageDataChange = bindingClosure
        sut?.imageData = Data()
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }

    func testPositionBindingCalled() {
        sut?.onPositionChange = bindingClosure
        sut?.position = "New"
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }

    func testFullNameBindingCalled() {
        sut?.onFullNameChange = bindingClosure
        sut?.fullName = "New"
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }
    
    // MARK: Private helpers

    private func assertBindingCalled() {
        sut?.load()
        XCTAssertTrue(bindingMethodCalled, "Binding method not called")
    }
    
}
