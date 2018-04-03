//
//  TextDocumentClientCapabilities.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

/**
 * Text document specific client capabilities.
 */
public struct TextDocumentClientCapabilities: Codable {

    public let synchronization: Synchronization?

    public struct Synchronization: Codable {

        /**
         * Whether text document synchronization supports dynamic registration.
         */
        public let dynamicRegistration: Bool?

        /**
         * The client supports sending will save notifications.
         */
        public let willSave: Bool?

        /**
         * The client supports sending a will save request and
         * waits for a response providing text edits which will
         * be applied to the document before it is saved.
         */
        public let willSaveWaitUntil: Bool?

        /**
         * The client supports did save notifications.
         */
        public let didSave: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/completion`
     */
    public let completion: Completion?

    public struct Completion: Codable {

        /**
         * Whether completion supports dynamic registration.
         */
        public let dynamicRegistration: Bool?

        /**
         * The client supports the following `CompletionItem` specific
         * capabilities.
         */
        public let completionItem: CompletionItem?

        public struct CompletionItem: Codable {

            /**
             * Client supports snippets as insert text.
             *
             * A snippet can define tab stops and placeholders with `$1`, `$2`
             * and `${3:foo}`. `$0` defines the final tab stop, it defaults to
             * the end of the snippet. Placeholders with equal identifiers are linked,
             * that is typing in one will update others too.
             */
            public let snippetSupport: Bool?

            /**
             * Client supports commit characters on a completion item.
             */
            public let commitCharactersSupport: Bool?

            /**
             * Client supports the follow content formats for the documentation
             * property. The order describes the preferred format of the client.
             */
            public let documentationFormat: [MarkupKind]?
        }

        public let completionItemKind: CompletionCompletionItemKind?

        public struct CompletionCompletionItemKind: Codable {

            /**
             * The completion item kind values the client supports. When this
             * property exists the client also guarantees that it will
             * handle values outside its set gracefully and falls back
             * to a default value when unknown.
             *
             * If this property is not present the client only supports
             * the completion items kinds from `Text` to `Reference` as defined in
             * the initial version of the protocol.
             */
            public let valueSet: [CompletionItemKind]?
        }

        /**
         * The client supports to send additional context information for a
         * `textDocument/completion` request.
         */
        public let contextSupport: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/hover`
     */
    public let hover: Hover?

    public struct Hover: Codable {

        /**
         * Whether hover supports dynamic registration.
         */
        public let dynamicRegistration: Bool?

        /**
         * Client supports the follow content formats for the content
         * property. The order describes the preferred format of the client.
         */
        public let contentFormat: [MarkupKind]?
    }

    /**
     * Capabilities specific to the `textDocument/signatureHelp`
     */
    public let signatureHelp: SignatureHelp?

    public struct SignatureHelp: Codable {

        /**
         * Whether signature help supports dynamic registration.
         */
        public let dynamicRegistration: Bool?

        /**
         * The client supports the following `SignatureInformation`
         * specific properties.
         */
        public let signatureInformation: SignatureInformation?

        public struct SignatureInformation: Codable {

            /**
             * Client supports the follow content formats for the documentation
             * property. The order describes the preferred format of the client.
             */
            public let documentationFormat: [MarkupKind]?
        }
    }

    /**
     * Capabilities specific to the `textDocument/references`
     */
    public let references: References?

    public struct References: Codable {

        /**
         * Whether references supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/documentHighlight`
     */
    public let documentHighlight: DocumentHighlight?

    public struct DocumentHighlight: Codable {

        /**
         * Whether document highlight supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/documentSymbol`
     */
    public let documentSymbol: DocumentSymbol?

    public struct DocumentSymbol: Codable {

        /**
         * Whether document symbol supports dynamic registration.
         */
        public let dynamicRegistration: Bool?

        /**
         * Specific capabilities for the `SymbolKind`.
         */
        public let symbolKind: DocumentSymbolSymbolKind?

        public struct DocumentSymbolSymbolKind: Codable {

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
     * Capabilities specific to the `textDocument/formatting`
     */
    public let formatting: Formatting?

    public struct Formatting: Codable {

        /**
         * Whether formatting supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/rangeFormatting`
     */
    public let rangeFormatting: RangeFormatting?

    public struct RangeFormatting: Codable {

        /**
         * Whether range formatting supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/onTypeFormatting`
     */
    public let onTypeFormatting: OnTypeFormatting?

    public struct OnTypeFormatting: Codable {

        /**
         * Whether on type formatting supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/definition`
     */
    public let definition: Definition?

    public struct Definition: Codable {

        /**
         * Whether definition supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/typeDefinition`
     *
     * Since 3.6.0
     */
    public let typeDefinition: TypeDefinition?

    public struct TypeDefinition: Codable {

        /**
         * Whether typeDefinition supports dynamic registration. If this is set to `true`
         * the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
         * return value for the corresponding server capability as well.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/implementation`.
     *
     * Since 3.6.0
     */
    public let implementation: Implementation?

    public struct Implementation: Codable {

        /**
         * Whether implementation supports dynamic registration. If this is set to `true`
         * the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
         * return value for the corresponding server capability as well.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/codeAction`
     */
    public let codeAction: CodeAction?

    public struct CodeAction: Codable {

        /**
         * Whether code action supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/codeLens`
     */
    public let codeLens: CodeLens?

    public struct CodeLens: Codable {

        /**
         * Whether code lens supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/documentLink`
     */
    public let documentLink: DocumentLink?

    public struct DocumentLink: Codable {

        /**
         * Whether document link supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/documentColor` and the
     * `textDocument/colorPresentation` request.
     *
     * Since 3.6.0
     */
    public let colorProvider: ColorProvider?

    public struct ColorProvider: Codable {

        /**
         * Whether colorProvider supports dynamic registration. If this is set to `true`
         * the client supports the new `(ColorProviderOptions & TextDocumentRegistrationOptions & StaticRegistrationOptions)`
         * return value for the corresponding server capability as well.
         */
        public let dynamicRegistration: Bool?
    }

    /**
     * Capabilities specific to the `textDocument/rename`
     */
    public let rename: Rename?

    public struct Rename: Codable {

        /**
         * Whether rename supports dynamic registration.
         */
        public let dynamicRegistration: Bool?
    }
}
