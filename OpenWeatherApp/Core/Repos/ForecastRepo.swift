//
//  ForecastRepo.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

class ForecastRepo: Repo {
    
    static let shared = ForecastRepo()
    
    func search(cityName: String, _ completion: @escaping (APIResponse<APIData<[Day]>>) -> ()) {
        provider.request(type: APIData<[Day]>.self, service: Api.Forecast.search(cityName: cityName)) { response in
            switch response {
            case let .onSuccess(response):
                self.store(of: response)
                completion(.onSuccess(response))
                break
            case let .onFailure(error):
                completion(.onFailure(error))
                break
            }
        }
    }
    
    private func store(of data: APIData<[Day]>) {
        DispatchQueue.main.async {
            CitiesManager.shared.store(of: data.city)
            DaysManager.shared.storeAll(of: data.list ?? [], in: data.city.id)
        }
    }
}
