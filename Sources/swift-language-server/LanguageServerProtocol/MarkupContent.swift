//
//  MarkupContent.swift
//  swift-language-server
//
//  Created by Koray Koska on 03.04.18.
//

import Foundation

/**
 * Describes the content type that a client supports in various
 * result literals like `Hover`, `ParameterInfo` or `CompletionItem`.
 *
 * Please note that `MarkupKinds` must not start with a `$`. This kinds
 * are reserved for internal usage.
 */
public enum MarkupKind: String, Codable {

    /// Plain text is supported as a content format
    case plainText = "plaintext"

    /// Markdown is supported as a content format
    case markdown = "markdown"
}

/**
 * A `MarkupContent` literal represents a string value which content is interpreted base on its
 * kind flag. Currently the protocol supports `plaintext` and `markdown` as markup kinds.
 *
 * If the kind is `markdown` then the value can contain fenced code blocks like in GitHub issues.
 * See https://help.github.com/articles/creating-and-highlighting-code-blocks/#syntax-highlighting
 *
 * Here is an example how such a string can be constructed using JavaScript / TypeScript:
 * ```ts
 * let markdown: MarkdownContent = {
 *  kind: MarkupKind.Markdown,
 *    value: [
 *        '# Header',
 *        'Some text',
 *        '```typescript',
 *        'someCode();',
 *        '```'
 *    ].join('\n')
 * };
 * ```
 *
 * *Please Note* that clients might sanitize the return markdown. A client could decide to
 * remove HTML from the markdown to avoid script execution.
 */
public struct MarkupContent: Codable {

    /// The type of the Markup
    public let kind: MarkupKind

    /// The content itself
    public let value: String
}
