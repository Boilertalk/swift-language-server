//
//  CompletionItemKind.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

/**
 * The kind of a completion entry.
 */
public enum CompletionItemKind: Int, Codable {

    case text = 1
    case method = 2
    case function = 3
    case constructor = 4
    case field = 5
    case variable = 6
    case `class` = 7
    case interface = 8
    case module = 9
    case property = 10
    case unit = 11
    case value = 12
    case `enum` = 13
    case keyword = 14
    case snippet = 15
    case color = 16
    case file = 17
    case reference = 18
    case folder = 19
    case enumMember = 20
    case constant = 21
    case `struct` = 22
    case event = 23
    case `operator` = 24
    case typeParameter = 25
}
