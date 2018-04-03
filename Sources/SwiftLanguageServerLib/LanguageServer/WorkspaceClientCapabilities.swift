//
//  WorkspaceClientCapabilities.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

/**
 * Workspace specific client capabilities.
 */
public struct WorkspaceClientCapabilities: Codable {

    /**
     * The client supports applying batch edits to the workspace by supporting
     * the request 'workspace/applyEdit'
     */
    public let applyEdit: Bool?

    /**
     * Capabilities specific to `WorkspaceEdit`s
     */
    public let workspaceEdit: WorkspaceEdit?

    public struct WorkspaceEdit: Codable {

        /**
         * The client supports versioned document changes in `WorkspaceEdit`s
         */
        public let documentChanges: Bool?
    }

    /**
     * Capabilities specific to the `workspace/didChangeConfiguration` notification.
     */
    public let didChangeConfiguration: DidChangeConfiguration?

    public struct DidChangeConfiguration: Codable {

        /**
         * Did change configuration notification supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
     */
    public let didChangeWatchedFiles: DidChangeWatchedFiles?

    public struct DidChangeWatchedFiles: Codable {

        /**
         * Did change watched files notification supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `workspace/symbol` request.
     */
    public let symbol: Symbol?

    public struct Symbol: Codable {

        /**
         * Symbol request supports dynamic registration.
         */
        public let dynamicRegistration: Bool?

        /**
         * Specific capabilities for the `SymbolKind` in the `workspace/symbol` request.
         */
        public let symbolKind: SymbolSymbolKind?

        public struct SymbolSymbolKind: Codable {

            /**
             * The symbol kind values the client supports. When this
             * property exists the client also guarantees that it will
             * handle values outside its set gracefully and falls back
             * to a default value when unknown.
             *
             * If this property is not present the client only supports
             * the symbol kinds from `File` to `Array` as defined in
             * the initial version of the protocol.
             */
            public let valueSet: [SymbolKind]?
        }
    }

    /**
     * Capabilities specific to the `workspace/executeCommand` request.
     */
    public let executeCommand: ExecuteCommand?

    public struct ExecuteCommand: Codable {

        /**
         * Execute command supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * The client has support for workspace folders.
     *
     * Since 3.6.0
     */
    public let workspaceFolders: Bool?

    /**
     * The client supports `workspace/configuration` requests.
     *
     * Since 3.6.0
     */
    public let configuration: Bool?
}
