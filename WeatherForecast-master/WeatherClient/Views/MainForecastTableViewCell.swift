//
//  MainForecastTableViewCell.swift
//  WeatherClient
//
//  Created by Iskandar Abdullayev on 10/14/19.
//  Copyright © 2019 Iskandar Abdullayev. All rights reserved.
//

import UIKit

class MainForecastTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet weak var mainDayLabel: UILabel!
    @IBOutlet weak var mainTemperatureLabel: UILabel!
    @IBOutlet weak var mainWeatherIconImage: UIImageView!
    
    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func mainDisplayWeather(using viewModel: DailyForecastViewModel) {
        mainDayLabel.text = viewModel.dayOfTheWeek
        mainTemperatureLabel.text = String(viewModel.high)
        mainTemperatureLabel.text = String(viewModel.low)
        mainWeatherIconImage.image = viewModel.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
