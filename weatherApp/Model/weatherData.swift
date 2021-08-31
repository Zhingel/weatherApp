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
