//
//  DeepLinkDestinationTests.swift
//  AboutNavigationTests
//
//  Created by Sha Yan on 12/1/1400 AP.
//

import XCTest
@testable import AboutNavigation

class DeepLinkDestinationTests: XCTestCase {
    
    
    var sut: ServerDeppLinkDestination!

    override func setUpWithError() throws {
        let urlString = "deeplink://item-list/item-detail/?item-detail-id:1"
        sut = ServerDeppLinkDestination(urlPath: urlString)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testPagesParsing() throws {
        XCTAssertEqual(sut.pages[0], "item-list")
        XCTAssertEqual(sut.pages[1], "item-detail")
    }
    
    func testParametersParsing() throws {
        XCTAssertEqual(sut.parameters.first?.value, "1")
                       XCTAssertEqual(sut.parameters.first?.key, .itemDetailID)
    }
    
    func testViewControllerParsing() throws {
        XCTAssertTrue(sut.viewControllers[0] is ItemListVC)
        XCTAssertTrue(sut.viewControllers[1] is ItemDetailVC)
        XCTAssertEqual((sut.viewControllers[1] as! ItemDetailVC).id , 1)
    }


}
