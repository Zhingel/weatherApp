//
//  Details.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import UIKit

class Details: UIViewController {
    let tempLabel = UILabel()
    var titleBar: String?
    var cityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.lightGray
        title = titleBar
        cityLayOut()
       
    }
  
    
       
    func cityLayOut() {
        cityLabel.textColor = .white
        cityLabel.font = cityLabel.font.withSize(50)
        tempLabel.textColor = .white
        tempLabel.font = tempLabel.font.withSize(40)
        let stackView1 = UIStackView(arrangedSubviews: [cityLabel, tempLabel])
        view.addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
    
}
