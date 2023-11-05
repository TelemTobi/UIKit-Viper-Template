import Foundation
import Moya

protocol Networking {
    
    associatedtype EndPoint: TargetTypeEndPoint
    
    func request<T: Parsable, E: Errorable>(_ endpoint: EndPoint, completion: @escaping (Result<T, E>) -> Void)
}
