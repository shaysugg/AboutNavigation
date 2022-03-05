//
//  AuthNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation
import UIKit

struct AuthNavigator: DummyAuthManagerRouteHandler {
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    func handleLogOut() {
        let navigationController = UINavigationController()
        let loginVC = LoginVCFactory().make(dependencies: .init())
        navigationController.pushViewController(loginVC, animated: false)
        window.rootViewController = navigationController
    }
    
    func handleLogIn() {
        let navigationController = UINavigationController()
        let messageVC = MessageVC(message: "Hello Dear User", image: UIImage(systemName: "face.smiling")!, imageColor: .systemGreen)
        let homeVC = ItemListVCFactory().make(dependencies: .init())
        
        navigationController.pushViewController(homeVC, animated: false)
        
        
        
        window.rootViewController = navigationController
        
        homeVC.present(messageVC, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                messageVC.dismiss(animated: true)
            }
        }
    }
    
    func handleRegister() {
        let navigationController = UINavigationController()
        let messageVC = MessageVC(message: "You are all set", image: UIImage(systemName: "person.fill.checkmark")!)
        let homeVC = ItemListVCFactory().make(dependencies: .init())
        
        navigationController.pushViewController(homeVC, animated: false)
        
       
        window.rootViewController = navigationController
        
        homeVC.present(messageVC, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                messageVC.dismiss(animated: true)
            }
        }
        
        
    }
    
  
    
    
}


