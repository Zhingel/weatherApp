//
//  Cell.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation

import UIKit

class Cell: UICollectionViewCell {
    let label: UILabel = .init()
    let image: UIView = .init()
    let temperatureLabel: UILabel = .init()
    let condition: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        label.textColor = .white
        label.font = label.font.withSize(40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.addSubview(temperatureLabel)
        temperatureLabel.textColor = .white
        temperatureLabel.font = temperatureLabel.font.withSize(35)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        self.addSubview(condition)
        condition.textColor = .white
        condition.font = condition.font.withSize(20)
        condition.translatesAutoresizingMaskIntoConstraints = false
        condition.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -30).isActive = true
        condition.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30).isActive = true
        self.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -75).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
