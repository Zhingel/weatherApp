//
//  ViewController.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import UIKit


class ViewController: UIViewController {
    var weather = [currentWeather]()
    let cities = ["Москва", "НьюЙорк", "Париж", "Милан", "Вена", "Берлин", "Токио", "Пенза", "Киев", "Рига"]
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
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        title = "WeatherApp"
       
        
        
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
        
        cell.backgroundColor = .green
        cell.layer.cornerRadius = 20
        cell.condition.text = weather[indexPath.row].conditionString
        cell.label.text = cities[indexPath.row]
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
        navigationController?.pushViewController(vc, animated: true)
    }
}
