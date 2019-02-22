//
//  WeatherContract.swift
//  WheaterApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import Foundation
import UIKit

protocol WeatherView: class {
    
    var weatherPresenter: WeatherPresentation? { get set }
    
    func showError(message: String)
    func showCurrentWeather(weather: WeatherModel)
}

protocol WeatherPresentation: class {
    var weatherView: WeatherView? { get set }
    var interactor: WeatherInteractorInput? { get set }
    var router: WeatherRouter? { get set }
    
    func getCurrentWeather(cityId: Int)
}

protocol WeatherInteractorInput: class {
    var presenter: WeatherInteractorOutput? { get set }
    func fetchCurrentWeather(cityId: Int)
}

protocol WeatherInteractorOutput: class {
    func onFetchedCurrentWeather(weather: WeatherModel)
    func onError(message: String)
}

protocol WeatherWireFrame: class {
    
    var viewController: UIViewController? { get set }
}
