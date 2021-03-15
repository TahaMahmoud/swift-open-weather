//
//  UITableViewCell+Extensions.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    var disclosureIndicatorColor: UIColor? {
        get {
            let button = getDisclosureIndicatorButton()
            return button?.tintColor
        }
        set {
            let button = getDisclosureIndicatorButton()
            let image = button?.backgroundImage(for: .normal)?.withRenderingMode(.alwaysTemplate)
            button?.setImage(image, for: .normal)
            button?.tintColor = newValue
        }
    }
    
    private func getDisclosureIndicatorButton() -> UIButton? {
        for view in subviews {
            if let button = view as? UIButton {
                return button
            }
        }
        return nil
    }
}
