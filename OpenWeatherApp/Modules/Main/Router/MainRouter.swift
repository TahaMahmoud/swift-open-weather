//
//  MainRouter.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class MainRouter: MainRouterInterface {
    
    weak var viewController: UIViewController?
    
    func presentErorr(with message: String?, btnTitle: String, handler: ((UIAlertAction) -> ())?) {
        viewController?.showError(with: message, btnTitle: btnTitle, handler: handler)
    }
    
    static func assembleModule() -> UIViewController {
        let view: MainController = MainController.loadFromNib()
        
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
}
