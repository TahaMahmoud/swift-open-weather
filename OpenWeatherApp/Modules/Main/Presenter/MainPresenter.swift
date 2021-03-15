//
//  MainPresenter.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class MainPresenter: MainPresenterInterface {
    
    weak var view: MainView?
    var router: MainRouterInterface!
    var interactor: MainInteractorInterface!
    
    var cityName: String? {
        didSet {
            didClickedSearch()
        }
    }
    
    var days: [Day]? {
        didSet {
            view?.reload()
        }
    }
    
    func didClickedSearch() {
        view?.showLoading()
        interactor.search(cityName: cityName ?? "")
    }
}

extension MainPresenter: MainInteractorOutput {
    
    func didSearch(days: [Day]) {
        view?.hideLoading()
        self.days = days
        view?.inform(with: "accurate_data".localized(), and: .systemGreen)
    }
    
    func didLoadCache(days: [Day], error: APIError) {
        view?.hideLoading()
        self.days = days
        view?.inform(with: "\("not_accurate_data".localized()) \("due_to".localized()) \(error.message ?? "")", and: .systemYellow)
    }
    
    func didFailedSearch(error: APIError) {
        view?.hideLoading()
        router.presentErorr(with: error.message, btnTitle: "retry".localized()) { _ in
            self.didClickedSearch()
        }
    }
}
