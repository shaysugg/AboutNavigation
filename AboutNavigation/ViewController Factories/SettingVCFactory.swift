//
//  SettingVCFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 12/13/1400 AP.
//

import Foundation

struct SettingVCFactory: ViewControllerFactory {
    func make(dependencies: SettingVCDependencies) -> SettingVC {
        return SettingVC()
        
    }
}

struct SettingVCDependencies {
}
