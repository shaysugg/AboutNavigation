//
//  ViewControllerFactory.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/17/1400 AP.
//

import Foundation
import UIKit


protocol ViewControllerFactory {
    associatedtype ViewController: UIViewController
    associatedtype Dependencies
    
    func make(dependencies: Dependencies) -> ViewController
}
