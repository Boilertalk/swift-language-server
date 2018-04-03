//
//  InitializeResult.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct InitializeResult: Codable {

    /**
     * The capabilities the language server provides.
     */
    public let capabilities: ServerCapabilities
}

public enum InitializeErrorCode: Int, Error, Codable {

    case unknownProtocolVersion = 1
}

public struct InitializeErrorData: Codable {

    /**
     * Indicates whether the client execute the following retry logic:
     * (1) show the message provided by the ResponseError to the user
     * (2) user selects retry or cancel
     * (3) if user selected retry the initialize method is sent again.
     */
    public let retry: Bool
}
