//
//  DidOpenTextDocumentParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

public struct DidOpenTextDocumentParams: Codable {

    /// The document that was opened.
    public let textDocument: TextDocumentItem
}
