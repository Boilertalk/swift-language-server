//
//  TextDocumentPositionParams.swift
//  swift-language-server
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct TextDocumentPositionParams: Codable {

    /// The text document.
    public let textDocument: TextDocumentIdentifier

    /// The position inside the text document.
    public let position: TextDocumentPosition
}
