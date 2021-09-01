//
//  ViewController.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import UIKit
import SwiftSVG


class ViewController: UIViewController {
    var weather = [currentWeather]()
    var cities = ["Москва", "НьюЙорк", "Париж", "Милан", "Вена", "Берлин", "Токио", "Пенза", "Киев", "Рига"]
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    var networkWeatherManager = NetworkWeather()
    let city = currentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.9023400545, green: 0.8969761729, blue: 0.9064632654, alpha: 1)
        title = "WeatherApp"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
        
        
        view.addSubview(collectionView)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        
        if weather.isEmpty {
            weather = Array(repeating: city, count: cities.count)
        }
        addCities()
        
    }
    
    @objc func addTapped(_ sender: UIButton) {
    self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) {[unowned self] city1 in
        self.cities.append(city1)
        self.weather.append(self.city)
        addCities()
    }
}
    func addCities() {
        getCityWeather(cities: self.cities) { (index,weather) in
            DispatchQueue.main.async {
                self.weather[index] = weather
                self.weather[index].name = self.cities[index]
                print(self.weather)
                self.collectionView.reloadData()
            }

        }
    }
}





extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(weather[indexPath.row].conditionCode).svg")
        let image = UIView(SVGURL: url!) { image in
            image.resizeToFit(CGRect(x: 40, y: 40, width: 40, height: 40))
            image.fillColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            image.strokeColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        }
        cell.backgroundColor = .darkGray
        cell.layer.cornerRadius = 20
        cell.condition.text = weather[indexPath.row].conditionString
        cell.label.text = cities[indexPath.row]
        cell.image.addSubview(image)
        cell.temperatureLabel.text = "\(weather[indexPath.row].temperatureString) °C"
        
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return   CGSize(width: view.bounds.width - 40, height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = Details()
        vc.tempLabel.text = "\(weather[indexPath.row].temperatureString) °C"
        vc.cityLabel.text = cities[indexPath.row]
        vc.titleBar = cities[indexPath.row]
        for day in  0...6 {
            vc.temp.append(weather[indexPath.row].forecastWeek[day].temp)
            vc.days.append(weather[indexPath.row].forecastWeek[day].date)
            
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController {
    func presentSearchAlertController(withTitle title: String?, message: String?, style: UIAlertController.Style, completionHandler: @escaping (String) -> Void) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: style)
        ac.addTextField { tf in
            let cities = ["Сан Франциско", "Москва", "Нью Йорк", "Стамбул", "Вена"]
            tf.placeholder = cities.randomElement()
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = ac.textFields?.first
            guard let cityName = textField?.text else { return }
            if cityName != "" {
                let city = cityName.split(separator:" ").joined(separator: "%20")
   //             self.networkWeatherManager.fetchCurrentWeater(forCity: cityName)
                completionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        ac.addAction(search)
        ac.addAction(cancel)
        present(ac, animated: true, completion: nil)
    }
}
