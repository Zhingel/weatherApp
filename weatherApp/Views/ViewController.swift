//
//  ViewController.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import UIKit

class ViewController: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    var networkWeatherManager = NetworkWeather()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .gray
        title = "WeatherApp"
        networkWeatherManager.onCompletion = {[weak self] currentWeather in
            guard let self = self else {return}
            print(currentWeather.condition)
            print(currentWeather.temperatureString)
            print(currentWeather.conditionCode)
            print(currentWeather.feelsLikeTemperatureString)
        }
        self.networkWeatherManager.fetchCurrentWeater()
        
        
        view.addSubview(collectionView)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
    
    
}



extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        cell.backgroundColor = .green
            cell.button.setImage(UIImage(systemName: "largecircle.fill.circle",withConfiguration: UIImage.SymbolConfiguration(pointSize: 30)),for: .normal)
        networkWeatherManager.onCompletion = {[weak self] currentWeather in
            guard self != nil else {return}
            DispatchQueue.main.async {
                cell.label.text = currentWeather.temperatureString
            }
            
        }
        
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
