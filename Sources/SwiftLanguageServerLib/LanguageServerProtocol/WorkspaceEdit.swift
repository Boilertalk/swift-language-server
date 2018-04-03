//
//  WorkspaceEdit.swift
//  swift-language-server
//
//  Created by Koray Koska on 27.03.18.
//

import Foundation

public struct WorkspaceEdit: Codable {

    /// Holds changes to existing resources.
    public let changes: [String: [TextEdit]]?

    /**
     * An array of `TextDocumentEdit`s to express changes to n different text documents
     * where each text document edit addresses a specific version of a text document.
     * Whether a client supports versioned document edits is expressed via
     * `WorkspaceClientCapabilities.workspaceEdit.documentChanges`.
     */
    public let documentChanges: [TextDocumentEdit]?
}
