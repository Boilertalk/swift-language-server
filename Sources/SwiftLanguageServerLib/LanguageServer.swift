//
//  LanguageServer.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

public class LanguageServer {

    public let clientCapabilities: ClientCapabilities

    public init(clientCapabilities: ClientCapabilities) {
        self.clientCapabilities = clientCapabilities
    }
}
