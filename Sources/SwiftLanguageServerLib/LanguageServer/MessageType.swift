//
//  MessageType.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public enum MessageType: Int, Codable {

    /// An error message.
    case error = 1

    /// A warning message.
    case warning = 2

    /// An information message.
    case info = 3

    /// A log message.
    case log = 4
}
