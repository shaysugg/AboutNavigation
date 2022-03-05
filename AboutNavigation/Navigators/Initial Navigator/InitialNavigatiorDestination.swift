//
//  InitialNavigatiorDestination.swift
//  AboutNavigation
//
//  Created by Sha Yan on 12/1/1400 AP.
//

import Foundation
import UIKit

protocol InitialVCDestination {
    var viewController: UIViewController { get }
}

struct InitialVCDestinationSplash :InitialVCDestination {
    var viewController: UIViewController {
        SplashVC()
    }
}

struct InitialVCDestinationLogin :InitialVCDestination {
    var viewController: UIViewController {
        let navigationController = UINavigationController()
        let loginVC = LoginVCFactory().make(dependencies: .init())
        navigationController.pushViewController(loginVC, animated: false)
        return navigationController
    }
}

struct InitialVCDestinationHome :InitialVCDestination {
    var viewController: UIViewController {
        let navigationController = UINavigationController()
        let loginVC = ItemListVCFactory().make(dependencies: .init())
        navigationController.pushViewController(loginVC, animated: false)
        return navigationController
    }
}


struct InitialVCDestinationDeepLink :InitialVCDestination {
    let deepLinkDestination: DeepLinkDestination
    
    var viewController: UIViewController {
        let navigationController = UINavigationController()
        for vc in deepLinkDestination.viewControllers {
            navigationController.pushViewController(vc, animated: false)
        }
        return navigationController
    }
}

extension InitialVCDestination where Self == InitialVCDestinationLogin {
    static var login: Self { Self() }
}

extension InitialVCDestination where Self == InitialVCDestinationHome {
    static var home: Self { Self() }
}

extension InitialVCDestination where Self == InitialVCDestinationSplash {
    static var splash: Self { Self() }
}

extension InitialVCDestination where Self == InitialVCDestinationDeepLink {
    static func deepLink(destination: DeepLinkDestination) -> Self {
        InitialVCDestinationDeepLink(deepLinkDestination: destination)
    }
}
