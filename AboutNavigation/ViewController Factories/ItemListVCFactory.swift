//
//  ItemListFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation
import UIKit

struct ItemListVCFactory: ViewControllerFactory {
    func make(dependencies: ItemListVCDependencies) -> ItemListVC {
        return ItemListVC()
    }
}

struct ItemListVCDependencies {
}
