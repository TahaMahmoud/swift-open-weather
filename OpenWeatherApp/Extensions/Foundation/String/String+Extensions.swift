//
//  String+Extensions.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation
import CoreLocation

extension String {
    
    func localized() -> String {
        return Localization.shared.localized(of: self)
    }
    
    /**
     Converts the first letter of the string to an upper case letter
     
     - returns: The string with a capitalized first letter
     */
    public var capitalizedFirstCharacter: String {
        if self.count > 1 {
            let startIndex = self.index(self.startIndex, offsetBy: 1)
            let begin = self[..<startIndex]
            let end = self[startIndex...]
            let first = begin.uppercased()
            return first + end
        }
        return self.capitalized
    }
    
    func from(format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
}
