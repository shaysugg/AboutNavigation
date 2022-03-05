//
//  Utils.swift
//  AboutNavigation
//
//  Created by Sha Yan on 11/11/1400 AP.
//

import Foundation

extension Array {
    public subscript(index: Int, default defaultValue: @autoclosure () -> Element) -> Element {
        guard index >= 0, index < endIndex else {
            return defaultValue()
        }

        return self[index]
    }
    
    public func itemAtOrNill(_ index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
