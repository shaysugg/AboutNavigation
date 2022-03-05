//
//  ForgotPasswordFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/18/1400 AP.
//

import Foundation
import UIKit

struct ForgotPasswordVCFactory: ViewControllerFactory {
    func make(dependencies: ForgotPasswordVCDependencies) -> ForgotPasswordVC {
        return ForgotPasswordVC()
    }
}

struct ForgotPasswordVCDependencies {
}
