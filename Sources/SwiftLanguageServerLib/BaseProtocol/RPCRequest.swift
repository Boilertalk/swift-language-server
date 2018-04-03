//
//  RPCRequest.swift
//  swift-language-server
//
//  Created by Koray Koska on 19.03.18.
//

import Foundation

public struct RPCRequest<Params: Codable>: Codable {

    /// The rpc id
    public let id: Int

    /// The jsonrpc version. Typically 2.0
    public let jsonrpc: String

    /// The jsonrpc method to be called
    public let method: String

    /// The jsonrpc parameters
    public let params: Params
}
