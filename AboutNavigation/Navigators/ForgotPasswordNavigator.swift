//
//  ForgetPasswordNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/18/1400 AP.
//

import Foundation
import UIKit

struct ForgotPasswordNavigator: Navigator {
    
    private let navigationController: UINavigationController?
    private let viewController: ForgotPasswordVC?
    
    init(navigationController: UINavigationController?, viewController: ForgotPasswordVC?) {
        self.navigationController = navigationController
        self.viewController = viewController
    }
    
    enum Destination {
        case passwordChanged
    }
    
    func go(to destination: Destination) {
        switch destination {
        case .passwordChanged:
            let sucessVC = MessageVC(message: "Your Password Changed sucessfully",
                                     image: UIImage(systemName: "checkmark.seal.fill"),
                                     imageColor: UIColor.systemGreen,
                                     textColor: UIColor.systemGreen
            )
            
            viewController?.present(sucessVC, animated: true) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    sucessVC.dismiss(animated: true) {
                        navigationController?.popToRootViewController(animated: true)
                    }
                }
            }
            
            
        }
    }
}
