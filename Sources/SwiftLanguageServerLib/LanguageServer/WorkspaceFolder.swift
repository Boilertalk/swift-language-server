//
//  WorkspaceFolder.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

public struct WorkspaceFolder: Codable {

    /// The associated URI for this workspace folder.
    public let uri: String

    /**
     * The name of the workspace folder. Defaults to the
     * uri's basename.
     */
    public let name: String
}
