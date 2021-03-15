//
//  UIImageView+Extensions.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

enum IconSize {
    static let x2 = "@2x.png"
}

extension UIImageView {
    
    func loadImage(url: String?) {
        URLSessionProvider.shared.loadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async { self.image = image }
        }
    }
}
