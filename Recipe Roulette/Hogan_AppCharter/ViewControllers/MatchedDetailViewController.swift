//
//  MatchedDetailViewController.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/8/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App Charter
 
 
 Purpose:     This a view controller to control the Matched Detail View
 
 
 ***************************************************************************************************/


import UIKit

class MatchedDetailViewController: UIViewController {
    //Variables to the connected outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var readyLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    
    //Varaibles to hold the incoming data
    var imageURL:String!
    var websiteURL:String!
    var sourceName:String!
    var readyInMinutes: Int!
    var servings:Int!
    var rating:Int!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageString = imageURL//String version of the URL
        let ImageURL:URL = URL(string:imageString!)!//Converts the string to a URL
        let imageData:NSData = NSData(contentsOf: ImageURL)!//Gets the data from the URL
        let image = UIImage(data: imageData as Data)//Gets the image from the data
        
        imageView.image = image
        
        //Creates and outputs the strings to the detail view
        sourceLabel.text = "This recipe is from \(sourceName!)."
          let readyInMinutesString = String(describing: readyInMinutes!)//Convert Int to String
        readyLabel.text = "This recipe will take \(readyInMinutesString) minutes to prepare."
        let ratingString = String(describing: rating!)//Convert Int to String
        ratingLabel.text = "This recipe has a rating of \(ratingString)/100."
        let servingString = String(describing: servings!)//Convert Int to String
        servingsLabel.text = "This recipe has \(servingString) servings in it."
        
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Pass the information to the RecipeWebViewController for loading of the recipe website
        if (segue.identifier == "WWW") {
                let destVC = segue.destination as! RecipeWebViewController
            
                //Sets the title to the title of this view,aka the recipe name
                destVC.navigationItem.title = navigationItem.title
                
                destVC.websiteString = websiteURL
            }
        }

    
}


