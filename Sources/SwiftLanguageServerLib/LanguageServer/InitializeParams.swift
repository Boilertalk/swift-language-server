//
//  InitializeParams.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

public struct InitializeParams: Codable {

    /**
     * The process Id of the parent process that started
     * the server. Is null if the process has not been started by another process.
     * If the parent process is not alive then the server should exit (see exit notification) its process.
     */
    public let processId: Int?


    /**
     * The rootPath of the workspace. Is null
     * if no folder is open.
     *
     * @deprecated in favour of rootUri.
     */
    public let rootPath: String?

    /**
     * The rootUri of the workspace. Is null if no
     * folder is open. If both `rootPath` and `rootUri` are set
     * `rootUri` wins.
     */
    public let rootUri: String?

    // How do we treat "Any" types with codable?
    // public let initializationOptions: ???

    /**
     * The capabilities provided by the client (editor or tool)
     */
    public let capabilities: ClientCapabilities

    /**
     * The initial trace setting. If omitted trace is disabled ('off').
     */
    public let trace: Trace

    public enum Trace: String, Codable {

        case off = "off"
        case messages = "messages"
        case verbose = "verbose"
    }

    /**
     * The workspace folders configured in the client when the server starts.
     * This property is only available if the client supports workspace folders.
     * It can be `null` if the client supports workspace folders but none are
     * configured.
     *
     * Since 3.6.0
     */
    public let workspaceFolders: [WorkspaceFolder]?
}
