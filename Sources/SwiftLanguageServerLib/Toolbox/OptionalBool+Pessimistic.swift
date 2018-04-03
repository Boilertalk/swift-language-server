//
//  OptionalBool+Pessimistic.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

extension Optional where Wrapped == Bool {

    var pessimisticBool: Bool {
        if let val = self {
            return val
        } else {
            return false
        }
    }
}
