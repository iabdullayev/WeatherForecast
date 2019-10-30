//
//  ForecastProvider.swift
//  WeatherClient
//
//  Created by Iskandar Abdullayev on 10/15/19.
//  Copyright © 2019 Iskandar Abdullayev. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    
    fileprivate let apiKey = "0e1b7c60d8a3882ff1d92aa714e43da5"
    
    lazy var baseUrl: URL = {
       
        return URL(string: "https://api.darksky.net/forecast/\(self.apiKey)/")!

    }()
    
    let downloader = JSONDownloader()
    
    typealias CurrentWeatherCompletionHandler = (Forecast?, DarkSkyError?) -> Void
    
    func getCurrentWeather(at coordinate: LocationService, completionHandler completion: @escaping CurrentWeatherCompletionHandler) {
        
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
            
        }
        let request = URLRequest(url: url)
        
        let task = downloader.jsonTask(with: request) { json, error in
            
            DispatchQueue.main.sync {
                guard let json = json else {
                    completion(nil, error)
                    return
                }
                guard let currentWeatherJson = json["currently"] as? [String: AnyObject],
                    let currentWeather = Forecast(json: currentWeatherJson) else {
                    completion(nil, .jsonParsingFailure)
                    return
                }
                
                completion(currentWeather, nil)
            }
        }
        task.resume()
    }
}
