//
//  UIViewController.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
    func showError(with message: String?, btnTitle: String, handler: ((UIAlertAction) -> ())?) {
        AlertController.shared.show(in: self, message: message ?? "something_went_worng".localized(), btnTitle: btnTitle, handler: handler)
    }
    
    public func addActionSheetForIpad(actionSheet: UIAlertController) {
        if let popoverPresentationController = actionSheet.popoverPresentationController {
            popoverPresentationController.sourceView = self.view
            popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverPresentationController.permittedArrowDirections = []
        }
    }
}
