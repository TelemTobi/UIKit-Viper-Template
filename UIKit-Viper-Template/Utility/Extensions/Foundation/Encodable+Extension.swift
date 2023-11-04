//
//  Encodable+Extension.swift
//  //  UIKit-Viper-Template
//
//  Created by Telem Tobi on 03/11/2023.Viper-Template
//
//  Created by Telem Tobi on 28/10/2023.
//

import Foundation

extension Encodable {
 
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
