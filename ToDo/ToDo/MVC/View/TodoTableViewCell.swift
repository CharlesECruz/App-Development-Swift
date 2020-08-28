//
//  TodoTableViewCell.swift
//  ToDo
//
//  Created by happy on 2020-06-24.
//  Copyright © 2020 Carlos. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet var taskLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = UITableViewCell.AccessoryType.detailDisclosureButton
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
