//
//  PlayerStatViewTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 06/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class PlayerStatViewTests: XCTestCase {
    
    var sut: PlayerStatView?
    var networkManager: MockNetworkManager?

    override func setUp() {
        super.setUp()
        networkManager = MockNetworkManager()
        sut = PlayerStatView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    override func tearDown() {
        sut = nil
        networkManager = nil
        super.tearDown()
    }

    func testImageDataBindingWhenViewModelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssertNotNil(sut?.viewModel?.onImageDataChange)
    }

    func testShortNameBindingWhenViewModelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssertNotNil(sut?.viewModel?.onShortNameChange)
    }

    func testJumperNumberBindingWhenViewModelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssertNotNil(sut?.viewModel?.onImageDataChange)
    }

    func testPositionBindingWhenViewModelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssertNotNil(sut?.viewModel?.onPositionChange)
    }

    func testStatValueBindingWhenViewModelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssertNotNil(sut?.viewModel?.onStatValueChange)
    }

    func testPositionLabelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssert(sut?.positionValueLabel.text == "Position")
    }

    func testNumberLabelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssert(sut?.numberValueLabel.text == "1")
    }

    func testNameLabelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssert(sut?.nameValueLabel.text == "T. Player")
    }

    func testStatValueLabelSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssert(sut?.statValueLabel.text == "1")
    }

    func testPlayerStatViewSet() {
        sut?.viewModel = PlayerStatViewViewModel(player: Player.mock(), networkManager: networkManager!)
        XCTAssertNotNil(sut?.playerStatView)
    }
}
