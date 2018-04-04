//
//  ShowMessageParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct ShowMessageParams: Codable {

    /// The message type. See {@link MessageType}.
    public let type: MessageType

    /// The actual message.
    public let message: String
}
