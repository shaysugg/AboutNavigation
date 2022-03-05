//
//  ServerDeepLinkResolver.swift
//  AboutNavigation
//
//  Created by Sha Yan on 11/17/1400 AP.
//

import Foundation
import UIKit

struct ServerDeepLinkNameResolver {
    //god enum switch case?
    
    
    func resolve(name: ServerDeepLinkName, arguments: [ServerDeepLinkArguments: String]) -> UIViewController {
        switch name {
        case .login:
            return LoginVCFactory().make(dependencies: LoginVCDependencies())
        case .itemList:
            return ItemListVCFactory().make(dependencies: ItemListVCDependencies())
        case .itemDetail:
            //TODO: Handeling error of optionals like this,
            //what should happen an error? force unwrap? ignore?
            return ItemDetailVCFactory().make(dependencies: ItemDetailVCDependencies(id: Int(arguments[.itemDetailID]!)!))
            
            
        }
    }
    
}


enum ServerDeepLinkName: String {
    case login = "login"
    case itemList = "item-list"
    case itemDetail = "item-detail"
}

enum ServerDeepLinkArguments: String {
    case itemDetailID = "item-detail-id"
}


protocol ServerDeepLinkMapper {
    associatedtype Dependencies
    
    func viewController(dependencies: Dependencies) -> UIViewController
    var name: String { get }
}

struct LoginServerDeepLinkMapped: ServerDeepLinkMapper {
    let name = "login"
    func viewController(dependencies: LoginVCDependencies) -> UIViewController {
        return LoginVCFactory().make(dependencies: LoginVCDependencies())
    }
}
