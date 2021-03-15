//
//  MainController.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class MainController: BaseController {
    
    @IBOutlet weak var viewInfo: UIView!
    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenterInterface!
    let searchBar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        setupTableView()
        setupSearchBar()
    }
}

extension MainController: MainView {

    func reload() {
        tableView.reloadData()
    }
    
    func inform(with messaage: String, and color: UIColor) {
        viewInfo.isHidden = false
        viewInfo.backgroundColor = color
        lblInfo.text = messaage
    }
}
