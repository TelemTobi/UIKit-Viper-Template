//
//  TargetEndPoint.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.
//

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
