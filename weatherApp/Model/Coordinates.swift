//
//  Coordinates.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation
import CoreLocation

let networkWeather = NetworkWeather()

func getCityWeather(cities: [String], complitionHandler: @escaping(Int, currentWeather) -> Void) {
    for (index, city) in cities.enumerated() {
        getCoordinationFrom(city: city) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else {return}
            networkWeather.fetchCurrentWeater(lat: coordinate.latitude, lon: coordinate.longitude) { weather in
                complitionHandler(index, weather)
            }
        }
    }
}

func getCoordinationFrom(city: String, complition: @escaping(_ coodinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
    CLGeocoder().geocodeAddressString(city) {(placemark, error) in
        complition(placemark?.first?.location?.coordinate, error)
    }
}
