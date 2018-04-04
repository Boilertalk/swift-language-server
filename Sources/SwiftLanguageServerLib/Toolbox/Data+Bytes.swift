//
//  Data+Bytes.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

extension Data {

    var bytes: [UInt8] {
        return [UInt8](self)
    }
}
