//
//  TextDocumentIdentifier.swift
//  swift-language-server
//
//  Created by Koray Koska on 27.03.18.
//

import Foundation

public protocol TextDocumentIdentifierProtocol {

    /// The text document's URI.
    var uri: String { get }
}

public struct TextDocumentIdentifier: TextDocumentIdentifierProtocol, Codable {

    /// The text document's URI.
    public let uri: String
}

public struct VersionedTextDocumentIdentifier: TextDocumentIdentifierProtocol, Codable {

    /// The text document's URI.
    public let uri: String

    /**
     * The version number of this document. If a versioned text document identifier
     * is sent from the server to the client and the file is not open in the editor
     * (the server has not received an open notification before) the server can send
     * `null` to indicate that the version is known and the content on disk is the
     * truth (as speced with document content ownership)
     */
    public let version: Int?
}
