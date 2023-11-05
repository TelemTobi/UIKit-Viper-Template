import Foundation

protocol JsonResolver {
    static func resolve(_ data: Data) throws -> Data
}

extension JsonResolver {
    static func resolve(_ data: Data) throws -> Data { data }
}
