//
//  WeatherPresenter.swift
//  WheaterApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import Foundation
import UIKit

class WeatherPresenter: WeatherPresentation {

    
    var weatherView: WeatherView?
    
    var interactor: WeatherInteractorInput?
    
    var router: WeatherRouter?
    
    init(weatherView: WeatherView, viewController: UIViewController) {
        self.weatherView = weatherView
        self.interactor = WeatherInteractor(weatherPresenter: self)
        self.router = WeatherRouter(viewController: viewController)
    }
    
    func getCurrentWeather(cityId: Int) {
        self.interactor?.fetchCurrentWeather(cityId: cityId)
    }
}

extension WeatherPresenter: WeatherInteractorOutput {
    func onFetchedCurrentWeather(weather: WeatherModel) {
        weatherView?.showCurrentWeather(weather: weather)
    }
    
    func onError(message: String) {
        weatherView?.showError(message: message)
    }
    
    
}
