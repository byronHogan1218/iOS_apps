//
//  TableViewCell.swift
//  RushPicker_iOS11
//
//  Created by Kai Rush on 3/21/18.
//  Copyright © 2018 Kai Rush. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubTitle: UILabel!
    @IBOutlet weak var cellYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
