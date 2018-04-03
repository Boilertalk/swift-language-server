//
//  ClientCapabilities.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct ClientCapabilities: Codable {

    /**
     * Workspace specific client capabilities.
     */
    public let workspace: WorkspaceClientCapabilities?

    /**
     * Text document specific client capabilities.
     */
    public let textDocument: TextDocumentClientCapabilities?

    // How do we treat "Any" params?
    // public let experimental: ???
}
