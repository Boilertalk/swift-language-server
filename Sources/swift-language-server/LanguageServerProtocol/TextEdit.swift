//
//  TextEdit.swift
//  swift-language-server
//
//  Created by Koray Koska on 23.03.18.
//

import Foundation

public struct TextEdit: Codable {

    /**
     * The range of the text document to be manipulated. To insert
     * text into a document create a range where start === end.
     */
    public let range: TextDocumentRange

    /**
     * The string to be inserted. For delete operations use an
     * empty string.
     */
    public let newText: String
}
