//
//  Navigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit
protocol Navigator {
    associatedtype NavigatorDestination
    
    func go(to destination: NavigatorDestination)
}


//protocol AutoNavigator: Navigator {
//    associatedtype NavigatorDestination
//    
//    func performNavigation()
//    
//    func resolve(_ result: @escaping (NavigatorDestination) -> Void)
//    
//    func navigate(to destination: NavigatorDestination)
//}
//
//extension AutoNavigator {
//    func performNavigation() {
//        resolve { destination in
//            navigate(to: destination)
//        }
//    }
//}
