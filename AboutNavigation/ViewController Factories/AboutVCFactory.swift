//
//  AboutVCFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 12/13/1400 AP.
//

import Foundation

struct AboutUsVCFactory: ViewControllerFactory {
    func make(dependencies: AboutUsVCDependencies) -> AboutVC {
        return AboutVC()
        
    }
}

struct AboutUsVCDependencies {
}
