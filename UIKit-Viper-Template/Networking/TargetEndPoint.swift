import Foundation
import Moya

protocol TargetTypeEndPoint: TargetType {
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
    var dateDecodingStrategy: JSONDecoder.DateDecodingStrategy { get }
    
    #if DEBUG
    var shouldRequestStub: Bool { get }
    var shouldPrintLogs: Bool { get }
    #endif
}
