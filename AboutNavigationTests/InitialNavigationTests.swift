//
//  AboutNavigationTests.swift
//  AboutNavigationTests
//
//  Created by Sha Yan on 11/23/1400 AP.
//

import XCTest

@testable import AboutNavigation

class InitialNavigationTests: XCTestCase {
    

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testAuthenticated() throws {
        //given
        let storage = DeepLinkStorage()
        let authManager = AuthManagerSpy(
            config: .init(canLogin: true,
                          isAuthenticate: true,
                          user: UserInfo(name: "test", password: "test", email: "yo@yo.com")))
        
        
        let sut = InitialNavigatorResolverImpl(deepLinkStorage: storage, authManager: authManager)
        
        let vcTypes: [UIViewController.Type] = [ SplashVC.self ,ItemListVC.self]
        var viewControlllers: [UIViewController] = []
        
        let expect = expectation(description: "")
        
        //when
        sut.resolve { destination in
            
            viewControlllers.append(destination.viewController)
            
            if viewControlllers.count == vcTypes.count {
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2)
        
        //then
        XCTAssertTrue(viewControlllers[0] is SplashVC)
        XCTAssertTrue((viewControlllers[1] as! UINavigationController).viewControllers[0] is ItemListVC)
    }
    
    func testNotAuthenticated() throws {
        //given
        let storage = DeepLinkStorage()
        let authManager = AuthManagerSpy(
            config: .init(canLogin: true,
                          isAuthenticate: false,
                          user: UserInfo(name: "test", password: "test", email: "yo@yo.com")))
        
        
        let sut = InitialNavigatorResolverImpl(deepLinkStorage: storage, authManager: authManager)
        
        let vcTypes: [UIViewController.Type] = [ SplashVC.self ,ItemListVC.self]
        var viewControlllers: [UIViewController] = []
        
        let expect = expectation(description: "")
        
        //when
        sut.resolve { destination in
            
            viewControlllers.append(destination.viewController)
            
            if viewControlllers.count == vcTypes.count {
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2)
        
        //then
        XCTAssertTrue(viewControlllers[0] is SplashVC)
        XCTAssertTrue((viewControlllers[1] as! UINavigationController).viewControllers[0] is ItemListVC)
    }
    
    
    func testDeepLink() throws {
        //given
        let storage = DeepLinkStorage()
        let destination = ServerDeppLinkDestination(urlPath: "deeplink://item-list/item-detail/?item-detail-id:1")
        storage.store(destination: destination)
        let authManager = AuthManagerSpy(
            config: .init(canLogin: true,
                          isAuthenticate: true,
                          user: UserInfo(name: "test", password: "test", email: "yo@yo.com")))
        
        
        let sut = InitialNavigatorResolverImpl(deepLinkStorage: storage, authManager: authManager)
        
        let vcTypes: [UIViewController.Type] = [ SplashVC.self ,ItemListVC.self]
        var viewControlllers: [UIViewController] = []
        
        let expect = expectation(description: "")
        
        //when
        sut.resolve { destination in
            
            viewControlllers.append(destination.viewController)
            
            if viewControlllers.count == vcTypes.count {
                expect.fulfill()
            }
        }
        
        waitForExpectations(timeout: 2)
        
        //then
        XCTAssertTrue(viewControlllers[0] is SplashVC)
        XCTAssertTrue((viewControlllers[1] as! UINavigationController).viewControllers[0] is ItemListVC)
        XCTAssertTrue((viewControlllers[1] as! UINavigationController).viewControllers[1] is ItemDetailVC)
    }

}

fileprivate struct AuthManagerSpy: AuthManager {
    
    
    
    struct Configuration {
        let canLogin: Bool
        let isAuthenticate: Bool
        let user: UserInfo
    }
    
    let config: Configuration
    
    func login(username: String, password: String, complition: ((UserInfo) -> Void)?) {
        complition?(config.user)
    }
    
    func authenticate(complition: ((Bool) -> Void)?) {
        complition?(config.isAuthenticate)
    }
    
    func register(username: String, password: String, complition: ((UserInfo) -> Void)?) {
        complition?(config.user)
    }
    
    func logout() {
        
    }
    
    
}
