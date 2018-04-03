//
//  RPCNotification.swift
//  swift-language-server
//
//  Created by Koray Koska on 19.03.18.
//

import Foundation

public struct RPCNotification<Params: Codable>: Codable {

    /// The jsonrpc version. Typically 2.0
    public let jsonrpc: String

    /// The result
    public let result: Params?
}
