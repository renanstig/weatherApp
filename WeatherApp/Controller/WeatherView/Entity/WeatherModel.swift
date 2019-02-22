//
//  WeatherModel.swift
//  WheaterApp
//
//  Created by Renan Camaforte on 22.02.19.
//  Copyright © 2019 Renan Camaforte. All rights reserved.
//

import Foundation

struct WeatherModel: Decodable {
    var name: String?
    var cod: Int?
    var coord: Coord?
    var sys: Sys?
    var main: Main?
}

struct Coord: Decodable {
    var long: Double?
    var lat: Double?
}

struct Sys: Decodable {
    var country: String?
    var sunrise: Int?
    var sunset: Int?
}

struct Main: Decodable {
    var temp: Double?
    var humidity: Double?
    var pressure: Double?
    var temp_min: Double?
    var temp_max: Double?
}
