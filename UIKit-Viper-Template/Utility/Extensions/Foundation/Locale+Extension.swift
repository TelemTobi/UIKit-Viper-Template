//
//  Locale+Extension.swift
//  SwiftUI-Viper-Template
//
//  Created by Telem Tobi on 28/10/2023.
//

import Foundation

extension Locale {
    
    enum SupportedLocale: String {
        case english = "en_US"
        case hebrew = "he_IL"
        case french = "fr_FR"
        case german = "de_DE"

        var locale: Locale {
            return Locale(identifier: self.rawValue)
        }
    }
}
