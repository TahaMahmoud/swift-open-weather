//
//  Alert.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class AlertController: UIViewController {
    
    static let shared = AlertController()
    var alert: UIAlertController = UIAlertController()
    
    func show(in vc: UIViewController?,
              title: String? = nil,
              message: String? = nil,
              btnTitle: String? = nil,
              style: UIAlertController.Style = .alert,
              handler: ((UIAlertAction) -> ())? = nil
    ) {
        alert = UIAlertController(title: title, message: message, preferredStyle: style)
        vc?.addActionSheetForIpad(actionSheet: alert)
        alert.addAction(UIAlertAction(title: btnTitle ?? "ok".localized(), style: .default, handler: handler))
        alert.addAction(UIAlertAction(title: "cancel".localized(), style: .cancel))
        vc?.present(alert, animated: true)
    }
}

