//
//  SplashNvaigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 11/17/1400 AP.
//

import Foundation
import UIKit
import Resolver

struct InitialNavigator: Navigator {
    
    let navigatorResolver: InitialNavigatorResolver
    let window: UIWindow
    let windowScene: UIWindowScene
    
    func performNavigation() {
        navigatorResolver.resolve(go(to:))
    }
    
    
    func go(to destination: InitialVCDestination) {
        window.rootViewController = destination.viewController
        window.makeKeyAndVisible()
        window.windowScene = windowScene
    }
}





