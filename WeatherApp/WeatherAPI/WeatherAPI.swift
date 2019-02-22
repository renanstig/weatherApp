//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import Foundation
import Alamofire

class WeatherAPI: SessionManager {

    static let instance = WeatherAPI()
    let apiURL = "https://api.openweathermap.org/data/2.5/weather"
    let appId = "c49d05ba445860f82728f5aec9f2381d"
    
    func getWeatherFor(city id: Int) -> DataRequest {
        let baseURL = apiURL + "?id=\(id)&appid=\(appId)&units=metric"
        return self.request(baseURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<500)
    }
}
