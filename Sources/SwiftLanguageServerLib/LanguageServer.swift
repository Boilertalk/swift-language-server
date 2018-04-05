//
//  LanguageServer.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation
import SourceKittenFramework

public class LanguageServer {

    public enum Error: Swift.Error {

        case fileAlreadyOpen
        case uriMalformed
        case partialEditNotAllowed
        case fileNotOpen
        case noChanges
        case versionRequired
        case fileNotUsable
        case diagnosticsNotAvailable
    }

    public let clientCapabilities: ClientCapabilities

    public var openFiles: [String: TextDocumentItem]

    public init(clientCapabilities: ClientCapabilities) {
        self.clientCapabilities = clientCapabilities
        self.openFiles = [:]
    }

    // MARK: - Text Synchronization

    public func openFile(with params: DidOpenTextDocumentParams) throws {
        guard let url = URL(string: params.textDocument.uri), url.isFileURL else {
            throw Error.uriMalformed
        }
        let path = url.path
        let textDocument = params.textDocument

        if openFiles[path] != nil {
            throw Error.fileAlreadyOpen
        }

        openFiles[path] = textDocument
    }

    public func changeFile(with params: DidChangeTextDocumentParams) throws {
        guard let url = URL(string: params.textDocument.uri), url.isFileURL else {
            throw Error.uriMalformed
        }
        let path = url.path
        guard let textDocument = openFiles[path] else {
            throw Error.fileNotOpen
        }

        guard let lastChange = params.contentChanges.last else {
            throw Error.noChanges
        }

        guard lastChange.range == nil, lastChange.rangeLength == nil else {
            throw Error.partialEditNotAllowed
        }
        guard let version = params.textDocument.version else {
            throw Error.versionRequired
        }

        openFiles[path] = textDocument.update(version: version, text: lastChange.text)
    }

    public func closeFile(with params: DidCloseTextDocumentParams) throws {
        guard let url = URL(string: params.textDocument.uri), url.isFileURL else {
            throw Error.uriMalformed
        }

        openFiles[url.path] = nil
    }

    // MARK: - Diagnostics

    public func generateDiagnostics(for uri: String) throws -> PublishDiagnosticsParams {
        guard let url = URL(string: uri), url.isFileURL else {
            throw Error.uriMalformed
        }

        guard let file = File(path: url.path) else {
            throw Error.fileNotUsable
        }
        let editorOpenResponse = try Request.editorOpen(file: file).send()

        guard let diagnostics = editorOpenResponse["key.diagnostics"] as? [Any] else {
            throw Error.diagnosticsNotAvailable
        }

        var items: [TextDocumentDiagnostic] = []
        for d in diagnostics {
            guard let diagnostic = d as? [String: Any] else {
                throw Error.diagnosticsNotAvailable
            }

            guard let line = diagnostic["key.line"] as? NSNumber, let column = diagnostic["key.column"] as? NSNumber else {
                throw Error.diagnosticsNotAvailable
            }

            guard let severity = diagnostic["key.severity"] as? String else {
                throw Error.diagnosticsNotAvailable
            }

            let actualSeverity: TextDocumentDiagnostic.Severity
            switch severity {
            case "source.diagnostic.severity.error":
                actualSeverity = .error
            default:
                actualSeverity = .warning
            }

            guard let message = diagnostic["key.description"] as? String else {
                throw Error.diagnosticsNotAvailable
            }

            let position = TextDocumentPosition(line: Int(line), character: Int(column))
            let range = TextDocumentRange(start: position, end: position)

            let item = TextDocumentDiagnostic(range: range, severity: actualSeverity, code: nil, source: "BoilerSwift", message: message)

            items.append(item)
        }

        let publish = PublishDiagnosticsParams(uri: uri, diagnostics: items)

        return publish
    }
}
