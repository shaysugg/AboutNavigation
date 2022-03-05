//
//  SinglatonModules.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/25/1400 AP.
//

import Foundation
import Resolver
import UIKit

extension Resolver: ResolverRegistering {
    static public func registerAllServices() {
        Resolver.register(SampleAuthManager.self) { resolver, args in
            
            let authNavigator: AuthNavigator = resolve()
            let authManager = SampleAuthManager(
                configurations: .init(
                    isAuthenticate: true,
                    canLogin: true,
                    canRegister: true,
                    timeForLogin: 1,
                    timeForSignUp: 1,
                    timeForAuthenticate: 1),
                routeHandler: authNavigator)
            
            return authManager
        }.implements(AuthManager.self)
            .scope(.application)
        
        Resolver.register { DeepLinkStorage() }.scope(.application)
        
        Resolver.register {
            InitialNavigatorResolverImpl(deepLinkStorage: resolve(),
                                         authManager: resolve())
        }
        .implements(InitialNavigatorResolver.self)
        .scope(.application)
        
    }
    
    static func registerAuthNavigator(window: UIWindow) {
        Resolver.register {
            AuthNavigator(window: window)
        }.scope(.shared)
    }
    
    
    
}
