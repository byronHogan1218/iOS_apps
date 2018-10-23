//
//  TableViewCell.swift
//  BHogan_StudentDir
//
//  Created by Byron Hogan on 3/27/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//

/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App 6
 
 
 Purpose:     Creates a class for what each cell in the table should hold
 
 
 ***************************************************************************************************/
import UIKit

class TableViewCell: UITableViewCell {
    //Variables for the parts of the Cell

    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!
    
    override func awakeFromNib() {
        // Initialization code
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        // Configure the view for the selected Student
        super.setSelected(selected, animated: animated)
    }
    
}

