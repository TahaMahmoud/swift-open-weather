//
//  Console.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright Β© 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

open class Console {
    
    static func logAPI(_ url: String, _ headers: [String:String], _ body: Any, _ statusCode: Int, _ response: String, _ error: Error?) {
        log("----------------------- API Calling Start", "-----------------------")
        log("β€΄οΈ Url", url)
        log("ππ» Headers", headers)
        log("ππ» Body", body)
        log("ππ» Status Code", statusCode)
        log("β€΅οΈ Response", response)
        switch statusCode {
        case 200...299:
            log("ππ» State: \(url.replacingOccurrences(of: API.baseUrl, with: ""))", "π Success βΉ")
            break
        default:
            log("ππ» State: \(url.replacingOccurrences(of: API.baseUrl, with: ""))", "π₯ Error: \(String(describing: error)) βΉ")
            break
        }
        log("----------------------- API Calling End", "-----------------------")
    }
    
    static func logError(_ type: APIErrorType) {
        Console.log("π₯Error", "\(type)")
    }
    
    static func log(_ tag: String, _ text: Any) {
        #if DEBUG
        print("\(tag): \(text)")
        #endif
    }
}
