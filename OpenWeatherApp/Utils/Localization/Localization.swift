//
//  Localization.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class Localization: NSObject {
    
    static let shared = Localization()
    
    let local = LocaleManager()
    var bundle: Bundle!
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localized(of key: String) -> String {
        return bundle.localizedString(forKey: key, value: "", table: nil)
    }
    
    func saveLanguage(_ language: Language) {
        local.save(language)
        updateBundle(language)
    }
    
    func updateBundle(_ language: Language) {
        guard let path = Bundle.main.path(forResource: language.rawValue, ofType: "lproj") else { return }
        bundle = Bundle.init(path: path)
    }
    
    func getLanguage() -> Language {
        return Language(rawValue: local.get()) ?? Language.EN
    }
    
    func changeLanguage() {
        if getLanguage() == .EN {
            saveLanguage(.AR)
            setUISemanticContent(.forceRightToLeft)
        } else {
            saveLanguage(.EN)
            setUISemanticContent(.forceLeftToRight)
        }
    }
    
    func setUISemanticContent(_ semanticContent: UISemanticContentAttribute) {
        UIView.appearance().semanticContentAttribute = semanticContent
        UITextField.appearance().semanticContentAttribute = semanticContent
    }
}
