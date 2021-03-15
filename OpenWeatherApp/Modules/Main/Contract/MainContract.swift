//
//  MainContract.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

protocol MainView: class {
    var presenter: MainPresenterInterface! { get set }
    
    func showLoading()
    func hideLoading()
    
    func reload()
    func inform(with messaage: String, and color: UIColor)
}

protocol MainPresenterInterface: class {
    var view: MainView? { get set }
    var router: MainRouterInterface! { get set }
    var interactor: MainInteractorInterface! { get set }
    
    var cityName: String? { get set }
    var days: [Day]? { get set }
    
    func didClickedSearch()
}

protocol MainInteractorInterface: class {
    var output: MainInteractorOutput? { get set }
    
    func search(cityName: String)
}

protocol MainInteractorOutput: class {
    
    func didSearch(days: [Day])
    func didLoadCache(days: [Day], error: APIError)
    func didFailedSearch(error: APIError)
}

protocol MainRouterInterface: class {
    var viewController: UIViewController? { get set }
    
    func presentErorr(with message: String?, btnTitle: String, handler: ((UIAlertAction) -> ())?)
    
    static func assembleModule() -> UIViewController
}
