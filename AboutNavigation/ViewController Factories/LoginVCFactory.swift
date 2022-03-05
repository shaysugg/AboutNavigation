//
//  LoginVCFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation
import UIKit
import Resolver

struct LoginVCFactory: ViewControllerFactory {
    func make(dependencies: LoginVCDependencies) -> LoginVC {
        return LoginVC()
        
    }
}

struct LoginVCDependencies {
}
