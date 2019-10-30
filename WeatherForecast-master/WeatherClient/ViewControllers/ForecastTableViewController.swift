//
//  ForecastTableViewController.swift
//  WeatherClient
//
//  Created by Iskandar Abdullayev on 10/15/19.
//  Copyright © 2019 Iskandar Abdullayev. All rights reserved.
//

import UIKit

class ForecastTableViewController: UITableViewController {
    
    let client = DarkSkyAPIClient()
    
    var viewModels: [DailyForecastViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundNightSky.jpg")!)
        
        self.navigationController?.navigationBar.isTranslucent = true
        
        let coordinate = LocationService()
        client.getCurrentWeather(at: coordinate) { [unowned self] currentWeather, error in
            if let currentWeather = currentWeather {
                let viewModel = DailyForecastViewModel(model: currentWeather)
                
                DailyForecastTableViewCell.displayWeather(viewModel)
            }
        }
        
        
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! DailyForecastTableViewCell

        let mainCell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as! MainForecastTableViewCell
        
        if indexPath.row == 0 {
            let vm = viewModels[indexPath.row]
            mainCell.mainWeatherIconImage.image = vm.image
            mainCell.mainTemperatureLabel.text = "\((vm.high - 32) * 5/9)- \((vm.low - 32) * 5/9)ºC"
            mainCell.mainDayLabel.text = vm.dayOfTheWeek
            mainCell.mainDayLabel.text = "Today"
            mainCell.backgroundColor = UIColor.clear

            return mainCell
        } else {
            let vm = viewModels[indexPath.row]
            cell.weatherIconImageView.image = vm.image
            cell.temperatureLabel.text = "\((vm.high - 32) * 5/9)- \((vm.low - 32) * 5/9)ºC"
            cell.dayLabel.text = vm.dayOfTheWeek
            cell.backgroundColor = UIColor.clear

            return cell
            }
    }
}
