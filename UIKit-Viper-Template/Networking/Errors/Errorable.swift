//
//  Errorable.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.
//

import Foundation

protocol Errorable: Error, Codable, JsonResolver {
    var debugDescription: String { get }
    init(errorType: PredefinedError?)
}
