//
//  Main+Search.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

extension MainController: UISearchBarDelegate {
    
    func setupSearchBar() {
        searchBar.sizeToFit()
        searchBar.placeholder = "enter_city_name".localized()
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        navigationItem.titleView = searchBar
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        resetUI()
        searchBar.text = nil
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let keyword = searchBar.text?.capitalizedFirstCharacter {
            presenter.cityName = keyword
            resetUI()
        }
    }
    
    private func resetUI() {
        searchBar.endEditing(true)
        presenter.days?.removeAll()
        viewInfo.isHidden = true
    }
}
