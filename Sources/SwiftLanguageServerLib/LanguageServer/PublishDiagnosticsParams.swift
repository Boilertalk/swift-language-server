//
//  PublishDiagnosticsParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 05.04.18.
//

import Foundation

public struct PublishDiagnosticsParams: Codable {

    /// The URI for which diagnostic information is reported.
    public let uri: String

    /// An array of diagnostic information items.
    public let diagnostics: [TextDocumentDiagnostic]
}
