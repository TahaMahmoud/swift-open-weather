//
//  MainInteractor.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit
    
class MainInteractor: MainInteractorInterface {

    weak var output: MainInteractorOutput?
    
    func search(cityName: String) {
        ForecastRepo.shared.search(cityName: cityName) { [weak self] response in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch response {
                case let .onSuccess(response):
                    self.output?.didSearch(days: response.list ?? [])
                case let .onFailure(error):
                    let cities = CitiesManager.shared.retrieve(of: cityName)
                    if let city = cities.first {
                        let days = DaysManager.shared.retrieve(of: city.id)
                        self.output?.didLoadCache(days: days, error: error)
                    } else {
                        self.output?.didFailedSearch(error: error)
                    }
                }
            }
        }
    }
}
