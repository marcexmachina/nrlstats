//
//  DetailHeaderViewTests.swift
//  nrlstatsTests
//
//  Created by Marc O'Neill on 06/08/2018.
//  Copyright © 2018 marcexmachina. All rights reserved.
//

import XCTest
@testable import nrlstats

class DetailHeaderViewTests: XCTestCase {
    
    var sut: DetailHeaderView?

    override func setUp() {
        super.setUp()
        sut = DetailHeaderView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testImageDataBindingWhenViewModelSet() {
        sut?.viewModel = DetailHeaderViewViewModel(player: Player.mock())
        XCTAssertNotNil(sut?.viewModel?.onImageDataChange)
    }

    func testFullNameBindingWhenViewModelSet() {
        sut?.viewModel = DetailHeaderViewViewModel(player: Player.mock())
        XCTAssertNotNil(sut?.viewModel?.onFullNameChange)
    }

    func testPositionBindingWhenViewModelSet() {
        sut?.viewModel = DetailHeaderViewViewModel(player: Player.mock())
        XCTAssertNotNil(sut?.viewModel?.onPositionChange)
    }

    func testNameLabelSet() {
        sut?.viewModel = DetailHeaderViewViewModel(player: Player.mock())
        XCTAssert(sut?.nameValueLabel.text == "Test Player")
    }

    func testPositionLabelSet() {
        sut?.viewModel = DetailHeaderViewViewModel(player: Player.mock())
        XCTAssert(sut?.positionValueLabel.text == "Position")
    }

    func testImageSet() {
        sut?.viewModel = DetailHeaderViewViewModel(player: Player.mock())
        XCTAssertNotNil(sut?.headshotImageView.image)
    }
}
