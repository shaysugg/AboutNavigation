//
//  DeepLinkNavigator.swift
//  AboutNavigation
//
//  Created by Sha Yan on 11/5/1400 AP.
//

import Foundation
import UIKit

final class DeepLinkStorage {
    private(set) var destination: DeepLinkDestination?
    
    func store(destination: DeepLinkDestination) {
        self.destination = destination
    }
    
     var hasDestination: Bool { destination != nil }
}

protocol DeepLinkDestination {
    var viewControllers: [UIViewController] { get }
}

