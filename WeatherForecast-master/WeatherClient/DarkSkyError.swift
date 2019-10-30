//
//  DarkSkyError.swift
//  WeatherClient
//
//  Created by Feruza Atahodjaeva on 10/30/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl
    case jsonParsingFailure
}
