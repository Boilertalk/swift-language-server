//
//  FileSource.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

public struct FileSource {

    public let lines: [String]

    public init(lines: [String]) {
        self.lines = lines
    }
}
