//
//  LoginNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit

struct LoginNavigator: Navigator {
    
    private let navigationController: UINavigationController?
    private let viewController: LoginVC
    
    init(navigationController: UINavigationController?, viewController: LoginVC) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    enum Destination {
        case forgetPassword
        case signup
    }
    
    func go(to destination: Destination) {
        switch destination {
        case .signup:
            let vc = SignUpVCFactory().make(dependencies: SignUpVCDependencies())
            navigationController?.pushViewController(vc , animated: true)
            
        case .forgetPassword:
            let vc = ForgotPasswordVCFactory().make(dependencies: ForgotPasswordVCDependencies())
            viewController.present(vc, animated: true)
        }
    }
    
}
