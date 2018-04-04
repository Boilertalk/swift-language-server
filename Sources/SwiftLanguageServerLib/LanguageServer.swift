//
//  LanguageServer.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

public class LanguageServer {

    public enum Error: Swift.Error {

        case fileAlreadyOpen
        case uriMalformed
        case partialEditNotAllowed
        case fileNotOpen
        case noChanges
        case versionRequired
    }

    public let clientCapabilities: ClientCapabilities

    public var openFiles: [String: TextDocumentItem]

    public init(clientCapabilities: ClientCapabilities) {
        self.clientCapabilities = clientCapabilities
        self.openFiles = [:]
    }

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

    public func closeFile(path: String) {
        openFiles[path] = nil
    }
}
