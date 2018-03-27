//
//  TextDocumentEdit.swift
//  swift-language-server
//
//  Created by Koray Koska on 27.03.18.
//

import Foundation

public struct TextDocumentEdit: Codable {

    /// The text document to change.
    public let textDocument: VersionedTextDocumentIdentifier

    /// The edits to be applied.
    public let edits: [TextEdit]
}
