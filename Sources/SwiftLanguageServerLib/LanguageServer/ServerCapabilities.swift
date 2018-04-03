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
