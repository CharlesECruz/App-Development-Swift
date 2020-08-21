//
//  RestaurantCollectionViewController.swift
//  Assignment8-Restaurant
//
//  Created by happy on 2020-08-20.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit

private let itemSpacing: CGFloat = 8
private let sectionInsets: UIEdgeInsets = .init(top: 6, left: 12, bottom: 6, right: 12)

class RestaurantCollectionView: UICollectionView {
    
    var restaurants = [Restaurant]()
    var colum = false {
        didSet {
            DispatchQueue.main.async { self.reloadSections(IndexSet(integer: 0)) }
        }
    }
    
    private let IDCell = "RestaurantCell"
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        NotificationCenter.default.addObserver(self, selector: #selector(initUI), name: FoodController.restaurantsUpdatedNotification, object: nil)
    }
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = itemSpacing
        layout.minimumInteritemSpacing = itemSpacing
        self.init(frame: .zero, collectionViewLayout: layout)
        dataSource = self
        delegate = self
        register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: IDCell)
        backgroundColor = .systemGray6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateRestau(_ restaurants: [Restaurant]) {
        self.restaurants = restaurants
        DispatchQueue.main.async { self.reloadSections(IndexSet(integer: 0)) }
        
    }
    
    @objc private func initUI() {
        restaurants = FoodController.shared.restaurants
        DispatchQueue.main.async { self.reloadSections(IndexSet(integer: 0)) }
    }
    
}

extension RestaurantCollectionView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDCell, for: indexPath) as! RestaurantCollectionViewCell
        let restaurant = restaurants[indexPath.row]
        cell.imageView.image = restaurant.image
        cell.nameLabel.text = restaurant.name
        cell.costLabel.text = Array(repeating: "$", count: restaurant.cost).reduce("", +)
        cell.timeCategoriesLabel.text = restaurant.timeCategories.joined(separator: ", ")
        cell.foodCategoriesLabel.text = restaurant.foodCategories.joined(separator: ", ")
        return cell
    }
}

extension RestaurantCollectionView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 16
        return CGSize.init(width: (colum) ? width * 2 + 8 : width, height: width + 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
}

