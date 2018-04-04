//
//  FileReader.swift
//  SwiftLanguageServerLib
//
//  Created by Koray Koska on 04.04.18.
//

import Foundation

/**
 * A buffered reader for files.
 */
public class FileReader {

    public enum Error: Swift.Error {

        case fileDoesNotExist(path: String)

        case cannotReadFile(path: String)

        case internalError(details: String)
    }

    public let filepath: String
    private var fileHandle: FileHandle!

    public private(set) var atEof = false

    private var bufferedByte: UInt8? = nil

    /**
     * Initializes this `FileReader` with the given filepath.
     * Fails and throws if filepath is not a file or not readable (or does not exist).
     *
     * - parameter filepath: The path to the file.
     *
     * - throws: `Erro.fileDoesNotExist` if the file does not exists or is not a file.
     *           `Error.cannotReadFile` if the file is not readable.
     */
    public init(filepath: String) throws {
        var isDirectory: ObjCBool = true
        #if os(Linux)
        guard FileManager.default.fileExists(atPath: filepath, isDirectory: &isDirectory), !isDirectory else {
            throw Error.fileDoesNotExist(path: filepath)
        }
        #else
        guard FileManager.default.fileExists(atPath: filepath, isDirectory: &isDirectory), !isDirectory.boolValue else {
            throw Error.fileDoesNotExist(path: filepath)
        }
        #endif

        // Does not guarantee that our file is readable because of possible file system race conditions.
        // But it helps terminating gracefully before trying to read the file if it is indeed not readable.
        // Better for debugging...
        guard FileManager.default.isReadableFile(atPath: filepath) else {
            throw Error.cannotReadFile(path: filepath)
        }

        guard let fileHandle = FileHandle(forReadingAtPath: filepath) else {
            throw Error.cannotReadFile(path: filepath)
        }
        self.fileHandle = fileHandle

        self.filepath = filepath
    }

    deinit {
        close()
    }

    /**
     * Reads and returns the next line from the underlaying file.
     *
     * EOL characters are assumed to be either "\n", "\r\n" or "\r".
     *
     * EOL characters are not included into the response.
     *
     * - returns: The next line.
     */
    public func readLine() throws -> [UInt8]? {
        precondition(fileHandle != nil, "Attempt to read from closed file")

        if !atEof {
            var line: [UInt8] = []
            if let byte = bufferedByte {
                line.append(byte)
                bufferedByte = nil
            }
            while true {
                let bytes = fileHandle.readData(ofLength: 1).bytes
                if bytes.count == 0 {
                    atEof = true
                    // Current line is still a line
                    return line
                } else if bytes.count == 1 {
                    if bytes[0] == .newLine {
                        return line
                    } else if bytes[0] == .carriageReturn {
                        let nextBytes = fileHandle.readData(ofLength: 1).bytes
                        if nextBytes.count == 0 {
                            atEof = true
                            return line
                        } else if nextBytes.count == 1 {
                            if nextBytes[0] == .newLine {
                                return line
                            } else {
                                bufferedByte = nextBytes[0]
                                return line
                            }
                        } else {
                            throw Error.internalError(details: "FileHandle returned an unexpected number of bytes")
                        }
                    } else {
                        line.append(contentsOf: bytes)
                    }
                } else {
                    throw Error.internalError(details: "FileHandle returned an unexpected number of bytes")
                }
            }
        } else {
            return nil
        }
    }

    /**
     * Rewinds the file to the beginning.
     */
    public func rewind() {
        fileHandle.seek(toFileOffset: 0)
        atEof = false
    }

    /**
     * Closes the underlaying file. `readLine()` __will__ fail after calling this method.
     */
    public func close() {
        fileHandle?.closeFile()
        fileHandle = nil
    }
}

/**
 * Iterator for FileReader.
 */
extension FileReader: Sequence {

    public func makeIterator() -> FileReader.Iterator {
        return FileReader.Iterator(self)
    }

    public struct Iterator: IteratorProtocol {

        let reader: FileReader

        public init(_ reader: FileReader) {
            self.reader = reader
        }

        public mutating func next() -> [UInt8]? {
            do {
                return try reader.readLine()
            } catch {
                return nil
            }
        }
    }
}
