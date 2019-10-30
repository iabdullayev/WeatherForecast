//
//  DailyForecastTableViewCell.swift
//  WeatherClient
//
//  Created by Iskandar Abdullayev on 10/15/19.
//  Copyright © 2019 Iskandar Abdullayev. All rights reserved.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    // MARK: Outlets

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var weatherIconImageView: UIImageView!

    func displayWeather(using viewModel: DailyForecastViewModel) {
        dayLabel.text = viewModel.dayOfTheWeek
        temperatureLabel.text = String(viewModel.high)
        //temperatureLabel.text = String(viewModel.low)
        weatherIconImageView.image = viewModel.image
    }
    
    // MARK: Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
