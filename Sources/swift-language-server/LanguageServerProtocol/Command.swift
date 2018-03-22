//
//  Command.swift
//  swift-language-server
//
//  Created by Koray Koska on 23.03.18.
//

import Foundation

public struct Command<Args: Codable>: Codable {

    /// Title of the command, like `save`.
    public let title: String

    /// The identifier of the actual command handler.
    public let command: String

    /**
     * Arguments that the command handler should be
     * invoked with.
     */
    public let arguments: Args
}
