//
//  WeatherViewController.swift
//  WheaterApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController, WeatherView {

    var weatherPresenter: WeatherPresentation?
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var humidLabel: UILabel!
    @IBOutlet weak var cityName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherPresenter = WeatherPresenter(weatherView: self, viewController: self)
        weatherPresenter?.getCurrentWeather(cityId: 2761369)
    }
    
    func showError(message: String) {
        let alertView = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }
    
    func showCurrentWeather(weather: WeatherModel) {
        tempLabel.text = "Temperature: " + String(format: "%.1f", weather.main?.temp ?? "")
        humidLabel.text = "Humidity: " + String(format: "%.1f", weather.main?.humidity ?? "")
        cityName.text = "City: \(weather.name ?? "")"
    }
    
    @IBAction func loadTempInBauru(sender: AnyObject) {
        weatherPresenter?.getCurrentWeather(cityId: 6322133)
    }
    
    @IBAction private func loadTempInWien(sender: AnyObject) {
        weatherPresenter?.getCurrentWeather(cityId: 2761369)
    }
}
