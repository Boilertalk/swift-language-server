//
//  DidCloseTextDocumentParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 05.04.18.
//

import Foundation

public struct DidCloseTextDocumentParams: Codable {

    /// The document that was closed.
    public let textDocument: TextDocumentIdentifier
}
