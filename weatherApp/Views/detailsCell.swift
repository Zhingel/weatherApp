//
//  detailsCell.swift
//  weatherApp
//
//  Created by Стас Жингель on 01.09.2021.
//

import UIKit

class detailsCell: UICollectionViewCell {
    weak var textLabel: UILabel!
    weak var tempLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate ([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        textLabel = label
        textLabel.textColor = .white
        textLabel.font = textLabel.font.withSize(20)
        textLabel.textAlignment = .center
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(temp)
        NSLayoutConstraint.activate ([
            temp.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            temp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            temp.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        tempLabel = temp
        tempLabel.textColor = .white
        tempLabel.font = tempLabel.font.withSize(60)
        tempLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MyHeader: UICollectionViewCell {
    weak var textLabel: UILabel!
    weak var tempLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate ([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        textLabel = label
        textLabel.textColor = .white
        textLabel.font = textLabel.font.withSize(50)
        textLabel.textAlignment = .center
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(temp)
        NSLayoutConstraint.activate ([
            temp.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            temp.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30)
        ])
        tempLabel = temp
        tempLabel.textColor = .white
        tempLabel.font = tempLabel.font.withSize(40)
        tempLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
