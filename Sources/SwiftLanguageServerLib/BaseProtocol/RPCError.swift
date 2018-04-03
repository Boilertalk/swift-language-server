//
//  RPCError.swift
//  swift-language-server
//
//  Created by Koray Koska on 19.03.18.
//

import Foundation

public enum RPCError: Int, Error {

    // Defined by JSON RPC
    case parseError = -32700
    case invalidRequest = -32600
    case methodNotFound = -32601
    case invalidParams = -32602
    case internalError = -32603
    case serverErrorStart = -32099
    case serverErrorEnd = -32000
    case serverNotInitialized = -32002
    case unknownErrorCode = -32001

    // Defined by the protocol.
    case requestCancelled = -32800
}
