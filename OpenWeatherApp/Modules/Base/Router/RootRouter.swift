//
//  RootRouter.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class RootRouter {
    
    static func presentRootScreen(of vc: UIViewController) {
        let window = UIApplication.shared.connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .map({$0 as? UIWindowScene})
            .compactMap({ $0 })
            .first?.windows
            .filter({ $0.isKeyWindow }).first
        
        window?.makeKeyAndVisible()
        window?.rootViewController = vc
    }
    
    static func resetApp() {
        presentRootScreen(of: MainRouter.assembleModule())
    }
}
