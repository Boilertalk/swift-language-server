//
//  TextDocumentLocation.swift
//  swift-language-server
//
//  Created by Koray Koska on 19.03.18.
//

import Foundation

public struct TextDocumentLocation: Codable {

    public let uri: String

    public let range: TextDocumentRange
}
