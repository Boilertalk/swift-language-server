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
    }

    public let clientCapabilities: ClientCapabilities

    public var openFiles: [String: FileSource]

    public init(clientCapabilities: ClientCapabilities) {
        self.clientCapabilities = clientCapabilities
        self.openFiles = [:]
    }

    public func openFile(path: String) throws {
        if openFiles[path] != nil {
            throw Error.fileAlreadyOpen
        }

        let reader = try FileReader(filepath: path)

        var lines: [String] = []
        var line = try reader.readLine()?.string
        while let l = line {
            lines.append(l)
            line = try reader.readLine()?.string
        }

        openFiles[path] = FileSource(lines: lines)
    }

    public func closeFile(path: String) {
        openFiles[path] = nil
    }
}
