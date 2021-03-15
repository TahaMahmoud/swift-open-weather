//
//  Console.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

open class Console {
    
    static func logAPI(_ url: String, _ headers: [String:String], _ body: Any, _ statusCode: Int, _ response: String, _ error: Error?) {
        log("----------------------- API Calling Start", "-----------------------")
        log("⤴️ Url", url)
        log("👉🏻 Headers", headers)
        log("👉🏻 Body", body)
        log("👉🏻 Status Code", statusCode)
        log("⤵️ Response", response)
        switch statusCode {
        case 200...299:
            log("👉🏻 State: \(url.replacingOccurrences(of: API.baseUrl, with: ""))", "🏆 Success ⏹")
            break
        default:
            log("👉🏻 State: \(url.replacingOccurrences(of: API.baseUrl, with: ""))", "🔥 Error: \(String(describing: error)) ⏹")
            break
        }
        log("----------------------- API Calling End", "-----------------------")
    }
    
    static func logError(_ type: APIErrorType) {
        Console.log("🔥Error", "\(type)")
    }
    
    static func log(_ tag: String, _ text: Any) {
        #if DEBUG
        print("\(tag): \(text)")
        #endif
    }
}
