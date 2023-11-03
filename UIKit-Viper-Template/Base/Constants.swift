//
//  Constants.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.
//

import SwiftUI

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
