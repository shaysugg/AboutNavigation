//
//  ItemDetailVCFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/20/1400 AP.
//

import Foundation
import UIKit

struct ItemDetailVCFactory: ViewControllerFactory {
    func make(dependencies: ItemDetailVCDependencies) -> ItemDetailVC {
        return ItemDetailVC(id: dependencies.id)
    }
}

struct ItemDetailVCDependencies {
    let id: Int
}
