//
//  ServerDeepLinkDestination.swift
//  AboutNavigation
//
//  Created by Sha Yan on 11/17/1400 AP.
//

import Foundation
import UIKit

struct ServerDeppLinkDestination: DeepLinkDestination {
    let urlPath: String
    private let scheme = "deeplink://"
    private let pageFromParameterSeperator: String = "/?"
    private let pageSeperator: String = "/"
    private let parametersSeperator: String = "t="
    private let parametersKeyValueSeperator: String = ":"
    
    private var destinationString: String? {
        var path = urlPath
        guard let range = path.range(of: "deeplink://") else { return nil }
            
        path.removeSubrange(range)
        return path
    }
    
    private var pagesString: String? {
        destinationString?.components(separatedBy: pageFromParameterSeperator).first
    }
    
    private var parameterString: String? {
        destinationString?.components(separatedBy: pageFromParameterSeperator).itemAtOrNill(1)
    }
    
    var parameters: [ServerDeepLinkArguments: String] {
        let parameters = parameterString?.components(separatedBy: parametersSeperator) ?? []
        var dict = [ServerDeepLinkArguments: String]()
        for p in parameters {
            let components = p.components(separatedBy: parametersKeyValueSeperator)
            //TODO: Error Handeling there
            dict[ServerDeepLinkArguments(rawValue: components[0])!] = components[1]
        }
        return dict
    }
    
    var pages: [String] {
        (pagesString ?? "").components(separatedBy: pageSeperator)
    }
    
    
    var viewControllers: [UIViewController] {
        return pages.map({ component in
            ServerDeepLinkNameResolver().resolve(name: ServerDeepLinkName(rawValue: component)!, arguments: parameters)
        })
    }
}
