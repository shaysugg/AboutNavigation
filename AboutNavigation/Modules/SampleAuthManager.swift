//
//  DummyAuthManager.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation


class SampleAuthManager: AuthManager {
    
    let configurations: DummyAuthManagerConfiguration
    
    var routeHandler: DummyAuthManagerRouteHandler?
    
    init(configurations: DummyAuthManagerConfiguration, routeHandler: DummyAuthManagerRouteHandler?) {
        self.routeHandler = routeHandler
        self.configurations = configurations
    }
    
    func login(username: String, password: String, complition: ((UserInfo) -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + configurations.timeForSignUp) { [weak self] in
            
            guard let self = self else { return }
            
            self.routeHandler?.handleLogIn()
            complition?(UserInfo(name: username, password: password, email: ""))
        }
    }
    
    func register(username: String, password: String, complition: ((UserInfo) -> Void)?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + configurations.timeForLogin) { [weak self] in
            
            guard let self = self else { return }
            
            self.routeHandler?.handleRegister()
            complition?(UserInfo(name: username, password: password, email: ""))
        }
    }
    
    func logout() {
        routeHandler?.handleLogOut()
    }
    
    func authenticate(complition: ((Bool) -> Void)?) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + configurations.timeForAuthenticate) { [weak self] in
            
            guard let self = self else { return }
            
            let authenticate = self.configurations.isAuthenticate
            if !authenticate { self.routeHandler?.handleLogOut() }
            complition?(authenticate)
        }
        
    }
    
    
}

struct DummyAuthManagerConfiguration {
    let isAuthenticate: Bool
    let canLogin: Bool
    let canRegister: Bool
    let timeForLogin: TimeInterval
    let timeForSignUp: TimeInterval
    let timeForAuthenticate: TimeInterval
}


protocol DummyAuthManagerRouteHandler {
    func handleLogOut()
    func handleLogIn()
    func handleRegister()
}
