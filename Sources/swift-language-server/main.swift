import Foundation
import SwiftLanguageServerLib

/*
let reader = try FileReader(filepath: "test.txt")

var bytes: [UInt8]? = try reader.readLine()
while let b = bytes {
    print(String(bytes: b, encoding: .utf8))
    bytes = try reader.readLine()
}*/

print("*** SourceKit ***")

let client = try JSONDecoder().decode(ClientCapabilities.self, from: "{}".data(using: .utf8)!)
let server = LanguageServer(clientCapabilities: client)

print("Yay")

let path = "file:///somefile.swift"
try print(server.generateDiagnostics(for: path))
