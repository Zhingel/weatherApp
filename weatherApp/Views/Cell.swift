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
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(button)
        button.tintColor = .orange
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.addSubview(label)
        label.tintColor = .orange
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 30).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
