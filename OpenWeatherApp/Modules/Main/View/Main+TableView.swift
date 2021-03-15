//
//  Main+TableView.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

extension MainController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        tableView.initialize(cellClass: DayCell.self, delegate: self, dataSource: self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.days?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cellClass: DayCell.self)
        guard let day = presenter.days?[indexPath.row] else { return cell }
        cell.configure(with: day)
        return cell
    }
}
