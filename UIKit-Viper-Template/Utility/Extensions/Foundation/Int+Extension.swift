//
//  Int+Extension.swift
//  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023
//

import Foundation

extension Int {
    
    var zero: Int { 0 }
    
    var isError: Bool { return self >= 400 || self == 203 || self == 207 }
}
