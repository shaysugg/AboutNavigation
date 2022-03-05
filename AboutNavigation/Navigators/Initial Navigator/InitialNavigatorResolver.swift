//
//  InitialNavigatorResolver.swift
//  AboutNavigation
//
//  Created by Sha Yan on 12/1/1400 AP.
//

import Foundation

protocol InitialNavigatorResolver {
    func resolve(_ result: @escaping (InitialVCDestination) -> Void)
}

struct InitialNavigatorResolverImpl: InitialNavigatorResolver {
    let deepLinkStorage: DeepLinkStorage
    let authManager: AuthManager
    
    func resolve(_ result: @escaping (InitialVCDestination) -> Void) {
        result(.splash)
        
        
        authManager.authenticate { authenticate in
            if authenticate {
                
                if let destination = deepLinkStorage.destination {
                    result (.deepLink(destination: destination))
                    return
                }else {
                    result(.home)
                }
                
            }else {
                result(.login)
            }
        }
        
    }
}
