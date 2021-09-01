//
//  Details.swift
//  weatherApp
//
//  Created by Стас Жингель on 31.08.2021.
//

import UIKit

class Details: UIViewController {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    let tempLabel = UILabel()
    var titleBar: String?
    var cityLabel = UILabel()
    var temp = [Int]()
    var days = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9023400545, green: 0.8969761729, blue: 0.9064632654, alpha: 1)
        title = titleBar
        
        collectionView.register(detailsCell.self, forCellWithReuseIdentifier: "detailsCell")
        collectionView.register(MyHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header")
        view.addSubview(collectionView)
        collectionView.backgroundColor = .gray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
  
    
       
//    func cityLayOut() {
//        cityLabel.textColor = .white
//        cityLabel.font = cityLabel.font.withSize(50)
//        tempLabel.textColor = .white
//        tempLabel.font = tempLabel.font.withSize(40)
//        let stackView1 = UIStackView(arrangedSubviews: [cityLabel, tempLabel])
//        view.addSubview(stackView1)
//        stackView1.translatesAutoresizingMaskIntoConstraints = false
//        stackView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        stackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
//        stackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
//    }

}





extension Details: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        temp.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "detailsCell", for: indexPath) as! detailsCell
        cell.backgroundColor = .darkGray
        cell.layer.cornerRadius = 25
        cell.tempLabel.text = "\(temp[indexPath.row])°C"
        cell.textLabel.text = "\(days[indexPath.row])"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! MyHeader
        headerCell.textLabel.text = cityLabel.text
        headerCell.tempLabel.text = tempLabel.text
            return headerCell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: 0, height: 80)
    }
}
    
extension Details: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return   CGSize(width: view.bounds.width / 3 , height: 150)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 3, bottom: 20, right: 3)
    }
}
