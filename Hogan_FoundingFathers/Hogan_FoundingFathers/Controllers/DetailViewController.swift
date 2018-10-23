//
//  DetailViewController.swift
//  Hogan_FoundingFathers
//
//  Created by Byron Hogan on 2/19/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/22/18
 Assignment:  App 3
 
 
 Purpose:     To provide a view controller for the Detail view
 
 ***************************************************************************************************/
import UIKit

class DetailViewController: UIViewController {

    //Variables that the information with be outputed to
    @IBOutlet weak var ffatherImage: UIImageView!
    @IBOutlet weak var partyLabel: UILabel!
    @IBOutlet weak var spouseLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    

    
    // Variables to hold data passed from the TableViewController
    var tvffatherImage:String! // Founding father image NAME
    var tvnameLabel:String!     // Name
    var tvtitleLabel:String!     // Title
    var tvyearLabel:String!      // Years
    var tvspouseLabel:String!      // Spouse
    var tvpartyLabel:String!      // Party
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Place sent data into their outlets
        ffatherImage.image = UIImage(named: tvffatherImage)
        nameLabel.text = tvnameLabel
        titleLabel.text = tvtitleLabel
        yearLabel.text = tvyearLabel
        spouseLabel.text = tvspouseLabel
        partyLabel.text = tvpartyLabel
        
    }

}
