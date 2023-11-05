import Foundation
import Moya

class SomeAuthenticator: Authenticating {
    
    var accessKey: String? = "aLdrQccMiv1C19GBwLg0Ov9OzMakyvkNw44xFO22D4I"
    
    var authState: AuthState {
        // TODO: - Check network connection
        .reachable
    }
    
    func authenticate(with completion: @escaping SuccessCompletion) throws {
        completion(true)
    }

    func mapEndpoint(_ endpoint: Moya.Endpoint, for target: TargetTypeEndPoint) -> Moya.Endpoint {
        var headers: [String: String] = [
            "Accept-Version": "v1",
            "Authorization": "Client-ID \(accessKey ?? "")"
        ]
        
        target.headers?.forEach { (key, value) in
            headers[key] = value
        }
        
        return endpoint.adding(newHTTPHeaderFields: headers)
    }
}
