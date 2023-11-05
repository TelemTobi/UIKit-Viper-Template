import Foundation

extension Error {
    
    var isDecodingError: Bool { self is DecodingError }

    func printDecodingError() {
        #if DEBUG
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        print("ℹ️ Got ❌DECODING❌ error:")
        print("\(self)")
        print("🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨🚨")
        #endif
    }
}
