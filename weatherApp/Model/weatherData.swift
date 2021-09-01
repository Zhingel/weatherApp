//
//  weatherData.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation

struct currentWeatherData: Decodable {
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
}

struct Info: Decodable  {
    let url: String
}

struct Fact: Decodable {
    let temp: Int
    let icon: String
    let condition: String
    let feels_like: Int
}
struct Forecast: Decodable {
    let date: String
    let parts: Parts
}
struct Parts: Decodable {
    let  dayShort: Hour

    enum CodingKeys: String, CodingKey {
        case dayShort = "day_short"
       
    }
}
struct Hour: Decodable {
    let temp: Int?
}
