//
//  BaseController.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

public class BaseController: UIViewController {
    
    var loading: LoadingController?
    var uiRefreshControl = UIRefreshControl()
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        loading = LoadingController()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

// MARK: Refresher

extension BaseController {
    
    func addRefresher(_ tableView: UITableView, _ color: UIColor? = .gray) {
        uiRefreshControl.tintColor = color
        tableView.refreshControl = uiRefreshControl
    }
    
    func endRefresher() {
        if uiRefreshControl.isRefreshing {
            uiRefreshControl.endRefreshing()
        }
    }
}

// MARK: Loading

extension BaseController {
    
    func showLoading() {
        DispatchQueue.main.async {
            self.loading?.show()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.loading?.close()
        }
    }
}




