//
//  Error+Extension.swift
//  SwiftUI-Viper-Template
//
//  Created by Telem Tobi on 28/10/2023.
//

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
