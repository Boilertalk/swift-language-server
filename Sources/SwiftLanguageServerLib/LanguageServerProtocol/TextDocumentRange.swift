//
//  TextDocumentRange.swift
//  swift-language-server
//
//  Created by Koray Koska on 19.03.18.
//

import Foundation

public struct TextDocumentRange: Codable {

    /// The range's start position.
    public let start: TextDocumentPosition

    /// The range's end position.
    public let end: TextDocumentPosition
}
