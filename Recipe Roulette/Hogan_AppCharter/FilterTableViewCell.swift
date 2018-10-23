//
//  FilterTableViewCell.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/12/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App Charter
 
 
 Purpose:     Defines the parts of a filter table cell
 
 
 ***************************************************************************************************/
import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var checkboxLabel: UILabel!
    @IBOutlet weak var checkboxImage: UIImageView!
    override func awakeFromNib() {
            super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}




    

    


