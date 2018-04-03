//
//  ServerCapabilities.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

/**
 * Defines how the host (editor) should sync document changes to the language server.
 */
public enum TextDocumentSyncKind: Int, Codable {

    /**
     * Documents should not be synced at all.
     */
    case none = 0

    /**
     * Documents are synced by always sending the full content
     * of the document.
     */
    case full = 1

    /**
     * Documents are synced by sending the full content on open.
     * After that only incremental updates to the document are
     * send.
     */
    case incremental = 2
}

/**
 * Completion options.
 */
public struct CompletionOptions: Codable {

    /**
     * The server provides support to resolve additional
     * information for a completion item.
     */
    public let resolveProvider: Bool?

    /**
     * The characters that trigger completion automatically.
     */
    public let triggerCharacters: [String]?
}

/**
 * Signature help options.
 */
public struct SignatureHelpOptions: Codable {

    /**
     * The characters that trigger signature help
     * automatically.
     */
    public let triggerCharacters: [String]?
}

/**
 * Code Lens options.
 */
public struct CodeLensOptions: Codable {

    /**
     * Code lens has a resolve provider as well.
     */
    public let resolveProvider: Bool?
}

/**
 * Format document on type options
 */
public struct DocumentOnTypeFormattingOptions: Codable {

    /**
     * A character on which formatting should be triggered, like `}`.
     */
    public let firstTriggerCharacter: String

    /**
     * More trigger characters.
     */
    public let moreTriggerCharacter: [String]?
}

/**
 * Document link options
 */
public struct DocumentLinkOptions: Codable {

    /**
     * Document links have a resolve provider as well.
     */
    public let resolveProvider: Bool?
}

/**
 * Execute command options.
 */
public struct ExecuteCommandOptions: Codable {

    /**
     * The commands to be executed on the server
     */
    public let commands: [String]
}

/**
 * Save options.
 */
public struct SaveOptions: Codable {

    /**
     * The client is supposed to include the content on save.
     */
    public let includeText: Bool?
}

/**
 * Color provider Options
 */
public struct ColorProviderOptions: Codable {
}

public struct TextDocumentSyncOptions: Codable {

    /**
     * Open and close notifications are sent to the server.
     */
    public let openClose: Bool?

    /**
     * Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
     * and TextDocumentSyncKindIncremental.
     */
    public let change: TextDocumentSyncKind?

    /**
     * Will save notifications are sent to the server.
     */
    public let willSave: Bool?

    /**
     * Will save wait until requests are sent to the server.
     */
    public let willSaveWaitUntil: Bool?

    /**
     * Save notifications are sent to the server.
     */
    public let save: SaveOptions?
}

/**
 * Static registration options to be returned in the initialize request.
 */
public struct StaticRegistrationOptions {

    /**
     * The id used to register the request. The id can be used to deregister
     * the request again. See also Registration#id.
     */
    public let id: String?
}

public struct ServerCapabilities: Codable {

    /**
     * Defines how text documents are synced. Is either a detailed structure defining each notification or
     * for backwards compatibility the TextDocumentSyncKind number.
     *
     * Our Server Library doesn't need backwards compatibility so we don't allow TextDocumentSyncKind here.
     */
    public let textDocumentSync: TextDocumentSyncOptions?

    /**
     * The server provides hover support.
     */
    public let hoverProvider: Bool?

    /**
     * The server provides completion support.
     */
    public let completionProvider: CompletionOptions?

    /**
     * The server provides signature help support.
     */
    public let signatureHelpProvider: SignatureHelpOptions?

    /**
     * The server provides goto definition support.
     */
    public let definitionProvider: Bool?

    /**
     * The server provides Goto Type Definition support.
     *
     * Since 3.6.0
     */
    public let typeDefinitionProvider: Bool?

    /**
     * The server provides Goto Implementation support.
     *
     * Since 3.6.0
     */
    public let implementationProvider: Bool?

    /**
     * The server provides find references support.
     */
    public let referencesProvider: Bool?

    /**
     * The server provides document highlight support.
     */
    public let documentHighlightProvider: Bool?

    /**
     * The server provides document symbol support.
     */
    public let documentSymbolProvider: Bool?

    /**
     * The server provides workspace symbol support.
     */
    public let workspaceSymbolProvider: Bool?

    /**
     * The server provides code actions.
     */
    public let codeActionProvider: Bool?

    /**
     * The server provides code lens.
     */
    public let codeLensProvider: CodeLensOptions?

    /**
     * The server provides document formatting.
     */
    public let documentFormattingProvider: Bool?

    /**
     * The server provides document range formatting.
     */
    public let documentRangeFormattingProvider: Bool?

    /**
     * The server provides document formatting on typing.
     */
    public let documentOnTypeFormattingProvider: DocumentOnTypeFormattingOptions?

    /**
     * The server provides rename support.
     */
    public let renameProvider: Bool?

    /**
     * The server provides document link support.
     */
    public let documentLinkProvider: DocumentLinkOptions?

    /**
     * The server provides color provider support.
     *
     * Since 3.6.0
     */
    public let colorProvider: ColorProviderOptions?

    /**
     * The server provides execute command support.
     */
    public let executeCommandProvider: ExecuteCommandOptions?

    /**
     * Workspace specific server capabilities
     */
    public let workspace: Workspace

    public struct Workspace: Codable {

        /**
         * The server supports workspace folder.
         *
         * Since 3.6.0
         */
        public let workspaceFolders: WorkspaceFolders?

        public struct WorkspaceFolders: Codable {

            /**
             * The server has support for workspace folders
             */
            public let supported: Bool?

            /**
             * Whether the server wants to receive workspace folder
             * change notifications.
             *
             * If a strings is provided the string is treated as a ID
             * under which the notification is registed on the client
             * side. The ID can be used to unregister for these events
             * using the `client/unregisterCapability` request.
             *
             * Note: String is not supported in this Library.
             */
            public let changeNotifications: Bool?
        }
    }

    // How do we want to treat "Any" types with Codable?
    // public let experimental: ???
}
