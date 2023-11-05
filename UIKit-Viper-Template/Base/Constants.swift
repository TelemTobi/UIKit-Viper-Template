import Foundation

// MARK: -  Typealias

typealias Parsable = Decodable & JsonResolver
typealias JsonDictionary = [String: Any]
typealias DateFormat = Date.DateFormat

// MARK: - Completions

typealias SuccessCompletion = (_ success: Bool) -> Void
typealias EmptyCompletion = () -> Void

// MARK: - Contstants

enum Constants {
    
    enum TimeInterval {
        static let stubDelay: Double = 0.2
    }
}
