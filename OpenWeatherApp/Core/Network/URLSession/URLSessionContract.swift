//
//  URLSessionContract.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

protocol URLSessionProviderProtocol {
    
    func request<T>(type: T.Type?, service: ServiceProtocol, completion: @escaping (APIResponse<T>) -> ()) where T: Decodable
    func handleResponse<T: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: (APIResponse<T>) -> ())
    func info(_ task: URLSessionDataTask, _ body: Any?, _ data: Data?, _ response: URLResponse?, _ error: Error?)
    func loadImage(from url: String?, completion: @escaping (UIImage?) -> ())
}
