//
//  ItemListNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation
import UIKit

struct ItemListNavigator: Navigator {
    
    private let navigatorController: UINavigationController?
    
    init(navigatorController: UINavigationController?) {
        self.navigatorController = navigatorController
    }
    
    enum Destination {
        case itemDetail(id: Int)
        case setting
    }
    
    func go(to destination: Destination) {
        switch destination {
        case .itemDetail(let id):
            let vc = ItemDetailVCFactory().make(dependencies: .init(id: id))
            navigatorController?.pushViewController(vc, animated: true)
            
        case .setting:
            let vc = SettingVCFactory().make(dependencies: .init())
            navigatorController?.pushViewController(vc, animated: true)
        }
    }
}
