//
//  SignUpVCFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/17/1400 AP.
//

import Foundation
import UIKit

struct SignUpVCFactory: ViewControllerFactory {
    func make(dependencies: SignUpVCDependencies) -> SignUpVC {
        return SignUpVC()
    }
}

struct SignUpVCDependencies {
}
