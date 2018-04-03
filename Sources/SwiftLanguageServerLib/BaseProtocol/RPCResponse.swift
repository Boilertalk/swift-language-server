//
//  RPCResponse.swift
//  swift-language-server
//
//  Created by Koray Koska on 19.03.18.
//

import Foundation

public struct RPCResponse<Result: Codable, ErrorData: Codable>: Codable {

    /// The rpc id
    public let id: Int

    /// The jsonrpc version. Typically 2.0
    public let jsonrpc: String

    /// The result
    public let result: Result?

    /// The error
    public let error: Error<ErrorData>?

    public struct Error<ErrorData: Codable>: Codable {

        /// The error code
        let code: Int

        /// The error message
        let message: String

        /**
         * A Primitive or Structured value that contains additional
         * information about the error. Can be omitted.
         */
        let data: ErrorData?
    }
}
