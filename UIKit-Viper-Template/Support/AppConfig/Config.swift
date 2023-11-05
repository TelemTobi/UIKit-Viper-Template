import Foundation

enum Config {
    
    enum Key: String {
        case someApiBaseurl
    }
    
    static func value<T>(for key: Key) -> T? {
        let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue)
        
        switch T.self {
        case is String.Type: return value as? T
        case is Bool.Type: return (value as? String)?.boolValue as? T
        default: return nil
        }
    }
    
    enum someApi {
        static var baseUrl: String {
            value(for: .someApiBaseurl) ?? ""
        }
    }
}
