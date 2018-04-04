//
//  Bytes+String.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

extension Array where Element == UInt8 {

    var string: String {
        return String(bytes: self, encoding: .utf8) ?? ""
    }
}
