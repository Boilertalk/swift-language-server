//
//  ShowMessageRequestParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct ShowMessageRequestParams: Codable {

    /// The message type. See {@link MessageType}
    public let type: MessageType

    /// The actual message
    public let message: String

    /// The message action items to present.
    public let actions: [MessageActionItem]?
}

public struct MessageActionItem: Codable {

    /// A short title like 'Retry', 'Open Log' etc.
    public let title: String
}
