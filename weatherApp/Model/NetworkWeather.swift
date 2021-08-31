//
//  NetworkWeather.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation

class NetworkWeather {
//    var onCompletion: ((currentWeather) -> Void)?
    func fetchCurrentWeater() {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393&extra=true"
        guard let url = URL(string: urlString) else {return}
        var request = URLRequest(url: url, timeoutInterval: Double.infinity)
        request.addValue("4776677d-7799-4ce0-9cfd-8586bde216d7", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) {data, response, error in
            if let data = data {
//                if let currenWeather = self.parseJSON(withData: data) {
//                    self.onCompletion?(currenWeather)
//                }
                print(String(data:data, encoding: .utf8)!)
            }
        }
        task.resume()
    }
//    func parseJSON(withData data: Data) -> currentWeather? {
//        let decoder = JSONDecoder()
//        do {
//            let currentWeatherData = try decoder.decode(currentWeatherData.self, from: data)
//            guard let currentWeather = currentWeather(currentWeatherData: currentWeatherData) else {return nil}
//           return currentWeather
//        } catch let error as NSError {
//            print(error.localizedDescription)
//        }
//        return nil
//    }
}
