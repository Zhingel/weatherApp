//
//  currentWeather.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation
struct currentWeather {
    var name: String = "Название"
    var temperature: Int = 0
    var temperatureString: String {
        return String(temperature)
    }
    var feelsLikeTemperature: Int = 0
    var feelsLikeTemperatureString: String {
        return String(feelsLikeTemperature)
    }
    var conditionCode: String = ""
    var url: String = ""
    var condition: String = ""
    var conditionString: String {
        switch condition {
        case "clear" : return "ясно"
        case "partly-cloudy" : return "малооблачно"
        case "cloudy" : return "облачно с прояснениями"
        case "overcast" : return "пасмурно"
        case "drizzle" : return "морось"
        case "ight-rain" : return "небольшой дождь"
        case "rain" : return "дождь"
        case "moderate-rain" : return "умеренно сильный дождь"
        case "heavy-rain" : return "сильный дождь"
        case "continuous-heavy-rain" : return "длительный сильный дождь"
        case "showers" : return "ливень"
        case "wet-snow" : return "дождь со снегом"
        case "light-snow" : return "небольшой снег"
        case "snow" : return "снег"
        case "snow-showers" : return "снегопад"
        case "hail" : return "град"
        case "thunderstorm" : return "гроза"
        case "thunderstorm-with-rain" : return "дождь с грозой"
        case "thunderstorm-with-hail" : return "гроза с градом"
        default: return "Загрузка..."
        }
    }
   
    init?(currentWeatherData: currentWeatherData) {
        temperature = currentWeatherData.fact.temp
        feelsLikeTemperature = currentWeatherData.fact.feels_like
        conditionCode = currentWeatherData.fact.icon
        url = currentWeatherData.info.url
        condition = currentWeatherData.fact.condition
    }
    init() {
        
    }
}
