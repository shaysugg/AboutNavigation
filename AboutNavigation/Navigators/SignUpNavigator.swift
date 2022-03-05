//
//  RegisterNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/17/1400 AP.
//

import Foundation
import UIKit


struct SignUpNavigator: Navigator {
    
    let navigationController: UINavigationController?
    let viewController: SignUpVC
    
    
    enum Destination {
        case privacy
    }
    
    init(navigationController: UINavigationController?, viewController: SignUpVC) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    func go(to destination: Destination) {
        switch destination {
        case .privacy:
            let vc = PrivacyVC()
            vc.modalPresentationStyle = .popover
            viewController.present(vc, animated: true, completion: nil)
        }
    }
}


protocol SignUpDelegate {
    func registrationCompleted(userInfo: UserInfo)
}
