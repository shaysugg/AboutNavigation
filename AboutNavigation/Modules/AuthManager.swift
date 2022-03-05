//
//  AuthManager.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation

protocol AuthManager {
    
    func login(username: String, password: String, complition: ((UserInfo) -> Void)?)
    func login(username: String, password: String)
    
    func register(username: String, password: String, complition: ((UserInfo) -> Void)?)
    func register(username: String, password: String)
    
    func authenticate(complition: ((Bool) -> Void)?)
    func authenticate()
    
    func logout()
    
}

extension AuthManager {
    func login(username: String, password: String) {
        login(username: username, password: password, complition: nil)
    }
    
    func register(username: String, password: String) {
        register(username: username, password: password, complition: nil)
    }
    
    func authenticate() {
        authenticate(complition: nil)
    }
}
