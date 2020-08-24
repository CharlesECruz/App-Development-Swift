//
//  FoodieViewController.swift
//  Assignment8-Restaurant
//
//  Created by happy on 2020-08-20.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit

protocol FoodDelegate {
    func filterItem(_ restaurants: [Restaurant])
}

class FoodieViewController: UIViewController {
    
    private let filterBarCollectionView: FilterBarCollectionView = {
        let filterBarCV = FilterBarCollectionView()
        filterBarCV.translatesAutoresizingMaskIntoConstraints = false
        filterBarCV.constraintHeight(equalToConstant: 60)
        return filterBarCV
    }()
    
    private let restaurantCollectionView: RestaurantCollectionView = {
        let restaurantCV = RestaurantCollectionView()
        restaurantCV.translatesAutoresizingMaskIntoConstraints = false
        return restaurantCV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.barTintColor = .tertiarySystemBackground
        navigationItem.rightBarButtonItem = .init(image: UIImage.init(systemName: "rectangle.grid.2x2"),
                                                  style: UIBarButtonItem.Style.plain, target: self, action: #selector(layoutChange))
        
        navigationItem.title = "Assignment 8 Restaurant"
        navigationItem.largeTitleDisplayMode = .never
        
        setupFilterBarCollectionView()
        setupRestaurantCollectionView()
    }
    
    private func setupFilterBarCollectionView() {
        view.addSubview(filterBarCollectionView)
        filterBarCollectionView.foodieDelegate = self
        filterBarCollectionView.anchors(topAnchor: view.safeAreaLayoutGuide.topAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, bottomAnchor: nil)
    }
    
    private func setupRestaurantCollectionView() {
        view.addSubview(restaurantCollectionView)
        restaurantCollectionView.anchors(topAnchor: filterBarCollectionView.bottomAnchor, leadingAnchor: view.safeAreaLayoutGuide.leadingAnchor, trailingAnchor: view.safeAreaLayoutGuide.trailingAnchor, bottomAnchor: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    @objc private func layoutChange() {
        restaurantCollectionView.colum = !restaurantCollectionView.colum
        navigationItem.rightBarButtonItem?.image = UIImage.init(systemName: (restaurantCollectionView.colum) ? "rectangle.grid.1x2" : "rectangle.grid.2x2")
    }
    
}

extension FoodieViewController : FoodDelegate {
    
    func filterItem(_ restaurants: [Restaurant]) {
        restaurantCollectionView.updateRestau(restaurants)
    }
    
}
