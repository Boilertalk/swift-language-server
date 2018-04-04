//
//  DidChangeTextDocumentParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

public struct DidChangeTextDocumentParams: Codable {

    /**
     * The document that did change. The version number points
     * to the version after all provided content changes have
     * been applied.
     */
    public let textDocument: VersionedTextDocumentIdentifier

    /**
     * The actual content changes. The content changes describe single state changes
     * to the document. So if there are two content changes c1 and c2 for a document
     * in state S10 then c1 move the document to S11 and c2 to S12.
     */
    public let contentChanges: [TextDocumentContentChangeEvent]
}

/**
 * An event describing a change to a text document. If range and rangeLength are omitted
 * the new text is considered to be the full content of the document.
 */
public struct TextDocumentContentChangeEvent: Codable {

    /// The range of the document that changed.
    public let range: TextDocumentRange?

    /// The length of the range that got replaced.
    public let rangeLength: Int?

    /// The new text of the range/document.
    public let text: String
}
