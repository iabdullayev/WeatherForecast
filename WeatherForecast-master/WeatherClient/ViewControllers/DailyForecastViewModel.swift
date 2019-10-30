//
//  DailyForecastViewModel.swift
//  WeatherClient
//
//  Created by Iskandar Abdullayev on 10/15/19.
//  Copyright © 2019 Iskandar Abdullayev. All rights reserved.
//

import Foundation
import UIKit

struct DailyForecastViewModel {
    let dayOfTheWeek: String
    let high: Int
    let low: Int
    let image: UIImage?
    
    init(model: Forecast) {
        let highTemperature = Int(model.high)
        self.high = highTemperature
        
        let lowTemperature = Int(model.low)
        self.low = lowTemperature
        
        let weekDay = model.dayOfTheWeek
        self.dayOfTheWeek = "\(weekDay)"
        
        let weatherImageIcon = model.image
        self.image = weatherImageIcon
    }
}
