//
//  UITextField+Extensions.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

extension UITextField {
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        localize()
    }
    
    func localize() {
        self.textAlignment = (Localization.shared.getLanguage() == .EN ? .left : .right)
    }
}
