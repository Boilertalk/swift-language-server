//
//  TextDocumentDiagnostic.swift
//  swift-language-server
//
//  Created by Koray Koska on 22.03.18.
//

import Foundation

public struct TextDocumentDiagnostic: Codable {

    /// The range at which the message applies.
    public let range: TextDocumentRange

    /**
     * The diagnostic's severity. Can be omitted. If omitted it is up to the
     * client to interpret diagnostics as error, warning, info or hint.
     */
    public let severity: Severity?

    /// The diagnostic's code, which might appear in the user interface.
    public let code: Int?

    /**
     * A human-readable string describing the source of this
     * diagnostic, e.g. 'typescript' or 'super lint'.
     */
    public let source: String?

    /// The diagnostic's message.
    public let message: String

    public enum Severity: Int, Codable {

        /// Reports an error.
        case error = 1

        /// Reports a warning.
        case warning = 2

        /// Reports an information.
        case information = 3

        /// Reports a hint.
        case hint = 4
    }
}
