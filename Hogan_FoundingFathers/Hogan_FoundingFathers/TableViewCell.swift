//
//  TableViewCell.swift
//  Hogan_FoundingFathers
//
//  Created by Byron Hogan on 2/18/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/22/18
 Assignment:  App 3
 
 
 Purpose:     Creates a class for what each cell in the table should hold
 
 
 ***************************************************************************************************/
import UIKit

class TableViewCell: UITableViewCell {
    //Variables for the parts of the Cell
    @IBOutlet weak var CellTitle: UILabel!
    @IBOutlet weak var CellSubTitle: UILabel!
    @IBOutlet weak var CellImage: UIImageView!
    
    
    override func awakeFromNib() {
        // Initialization code
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected Founding Father
        super.setSelected(selected, animated: animated)
    }

}
