import Foundation
import SwiftLanguageServerLib

let reader = try FileReader(filepath: "test.txt")

var bytes: [UInt8]? = try reader.readLine()
while let b = bytes {
    print(String(bytes: b, encoding: .utf8))
    bytes = try reader.readLine()
}
