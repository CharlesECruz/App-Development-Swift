//
//  FilterBarCollectionViewCell.swift
//  Assignment8-Restaurant
//
//  Created by happy on 2020-08-20.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit

class FilterBarCollectionViewCell: UICollectionViewCell {
    
    let filterLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    var filtered = false {
        didSet {
            self.contentView.backgroundColor = (filtered) ? .systemBlue : .systemBackground
            filterLabel.textColor = (filtered) ? .systemBackground : .systemBlue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(filterLabel)
        contentView.layer.cornerRadius = 5.0
        filterLabel.matchParent(padding: .init(top: 8, left: 12, bottom: 8, right: 12))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
