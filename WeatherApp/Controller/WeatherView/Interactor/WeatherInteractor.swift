//
//  WeatherPresenter.swift
//  WheaterApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import Foundation

class WeatherInteractor: WeatherInteractorInput {
    var presenter: WeatherInteractorOutput?
    
    init(weatherPresenter: WeatherInteractorOutput) {
        presenter = weatherPresenter
    }
    
    func fetchCurrentWeather(cityId: Int) {
        WeatherAPI.instance.getWeatherFor(city: cityId).responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success:
                guard let data = dataResponse.data else {
                    self.presenter?.onError(message: "There was an error while fetching the current weather")
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let weather = try decoder.decode(WeatherModel.self, from: data)
                    self.presenter?.onFetchedCurrentWeather(weather: weather)
                } catch let err {
                    self.presenter?.onError(message: err.localizedDescription)
                }
            case .failure(let error):
                 self.presenter?.onError(message: error.localizedDescription)                
            }
        }
    }
    
    
}
