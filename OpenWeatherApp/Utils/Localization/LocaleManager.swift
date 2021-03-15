//
//  LocaleManager.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import Foundation

enum Language: String {
    case EN = "en"
    case AR = "ar"
}

class LocaleManager {
    
    static var shared = LocaleManager()
    let defaults = UserDefaults.standard
    
    func save(_ language: Language) {
        do  {
            try defaults.store(object: language.rawValue, key: .Language)
        } catch {
            print(error)
        }
    }
    
    func get() -> String {
        do {
            guard isExist(), let language = try defaults.retrive(type: String.self, key: .Language) else {
                return getDefaultLanguage()
            }
            return language
        } catch {
            return getDefaultLanguage()
        }
    }
    
    func getDefaultLanguage() -> String {
        return String(Locale.preferredLanguages[0].prefix(2))
    }
    
    func isExist() -> Bool {
        return defaults.isExist(key: .Language)
    }
    
    func delete() {
        defaults.delete(key: .Language)
    }
}

