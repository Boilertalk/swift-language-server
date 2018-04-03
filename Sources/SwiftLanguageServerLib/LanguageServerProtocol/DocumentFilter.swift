//
//  DocumentFilter.swift
//  swift-language-server
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct DocumentFilter: Codable {

    /// A language id, like `typescript`.
    public let language: String?

    /// A Uri scheme, like `file` or `untitled`.
    public let scheme: String?

    /// A glob pattern, like `*.{ts,js}`.
    public let pattern: String?
}

public typealias DocumentSelector = [DocumentFilter]
