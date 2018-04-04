//
//  TextDocumentItem.swift
//  swift-language-server
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct TextDocumentItem: Codable {

    /// The text document's URI.
    public let uri: String

    /// The text document's language identifier.
    public let languageId: String

    /**
     * The version number of this document (it will increase after each
     * change, including undo/redo).
     */
    public let version: Int

    /// The content of the opened text document.
    public let text: String
}

public extension TextDocumentItem {

    public func update(version: Int, text: String) -> TextDocumentItem {
        return TextDocumentItem(uri: uri, languageId: languageId, version: version, text: text)
    }
}
