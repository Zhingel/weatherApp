//
//  Cell.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import Foundation

import UIKit

class Cell: UICollectionViewCell {
    let button: UIButton = .init()
    let label: UILabel = .init()
    let temperatureLabel: UILabel = .init()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.addSubview(label)
        label.textColor = .white
        label.font = label.font.withSize(40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.addSubview(temperatureLabel)
        temperatureLabel.textColor = .white
        temperatureLabel.font = temperatureLabel.font.withSize(40)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 15).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
