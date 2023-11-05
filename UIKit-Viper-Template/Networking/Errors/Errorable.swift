import Foundation

protocol Errorable: Error, Codable, JsonResolver {
    var debugDescription: String { get }
    init(errorType: PredefinedError?)
}
