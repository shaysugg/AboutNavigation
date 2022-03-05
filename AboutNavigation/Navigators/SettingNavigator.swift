//
//  SettingNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 12/13/1400 AP.
//

import Foundation
import UIKit

struct SettingNavigator: Navigator {
    
    private let viewController: SettingVC
    
    init(viewController: SettingVC) {
        self.viewController = viewController
    }
    
    enum Destination {
        case aboutUs
    }
    
    func go(to destination: Destination) {
        switch destination {
        case .aboutUs:
            let vc = AboutUsVCFactory().make(dependencies: .init())
            viewController.present(vc, animated: true)
        }
    }
}
