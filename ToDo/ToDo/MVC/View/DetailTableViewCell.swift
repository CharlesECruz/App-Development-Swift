//
//  DetailTableViewCell.swift
//  ToDo
//
//  Created by happy on 2020-06-24.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    var textField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
                
    convenience init(placeholder: String) {
        self.init()
        contentView.addSubview(textField)
        textField.matchParent(padding: .init(top: 0, left: 10, bottom: 0, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
