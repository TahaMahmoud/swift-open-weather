//
//  DayCell.swift
//  OpenWeatherApp
//
//  Created by Mohamed Elbana on 3/15/21.
//  Copyright © 2021 Mohamed Elbana. All rights reserved.
//

import UIKit

class DayCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var lblWeatherState: UILabel!
    @IBOutlet weak var lblDate: UILabel!
 
    func configure(with day: Day) {
        loadIcon(of: day.weather.first?.icon)
        lblWeatherState.text = day.weather.first?.main
        lblDate.text = day.dtTxt.from(format: .server)?.to(to: .display)
    }
    
    private func loadIcon(of name: String?) {
        icon.loadImage(url: "\(API.SERVICE_IMAGES)\(name ?? "")\(IconSize.x2)")
    }
}
