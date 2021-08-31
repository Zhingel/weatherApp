//
//  currentWeather.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation
struct currentWeather {
    var name: String = "Название"
    let temperature: Int
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    let feelsLikeTemperature: Int
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    let conditionCode: String
    var url: String
    var condition: String
   
    init?(currentWeatherData: currentWeatherData) {
        temperature = currentWeatherData.fact.temp
        feelsLikeTemperature = currentWeatherData.fact.feels_like
        conditionCode = currentWeatherData.weather.first!.id
    }
}
