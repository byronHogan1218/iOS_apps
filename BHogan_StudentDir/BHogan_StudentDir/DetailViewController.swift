//
//  DetailViewController.swift
//  BHogan_StudentDir
//
//  Created by Byron Hogan on 3/29/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App 6
 
 
 Purpose:     To provide a view controller for the Detail view
 NOTE:Comment out lines 49-51(the lines with the if statement) if the image9.jpg issue is resolved after this is turned in
 ***************************************************************************************************/
import UIKit

class DetailViewController: UIViewController {

  
    
    //Variables to hold the label references
    @IBOutlet weak var tvStudentImage: UIImageView!
    @IBOutlet weak var tvYearLabel: UILabel!
    @IBOutlet weak var tvTermLable: UILabel!
    @IBOutlet weak var tvCourseLabel: UILabel!
    @IBOutlet weak var tvNumberLabel: UILabel!
    @IBOutlet weak var tvEmailLabel: UILabel!
    @IBOutlet weak var tvTitle: UILabel!
    @IBOutlet weak var tvIDLabel: UILabel!
    
    //Varaibles to hold incoming data
    var studentImage: String!
    var studentYear:String!
    var studentTerm:String!
    var studentCourse:String!
    var studentNumber:String!
    var studentEmail:String!
    var studentTitle:String!
    var studentID:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let imageString = studentImage//Assigns the URL to a string variable
//        if studentImage == "http://faculty.cs.niu.edu/~krush/ios/rs-images/image9.jpg"{//Checks for the incorrect URL and replaces it
//            imageString =  "http://faculty.cs.niu.edu/~krush/ios/rs-images/image9.jpeg"
//        }
        let imageURL:URL = URL(string:imageString!)!//Converts the URLString to the usable URL
        let imageData:NSData = NSData(contentsOf: imageURL)!//Gets the data from the URL
        let image = UIImage(data: imageData as Data)//Sets the image to the data gotten fomr the URL
        if studentTerm == "Fall"{//Determines if more spacing is needed to make the labels line up better
            studentTerm = "    Fall"
        }
        //assign the passsed data to its outputs
        tvStudentImage.image = image
        tvYearLabel.text = studentYear
        tvTermLable.text = studentTerm
        tvCourseLabel.text = studentCourse
        tvNumberLabel.text = studentNumber
        tvEmailLabel.text = studentEmail
        tvTitle.text = studentTitle
        tvIDLabel.text = studentID
        
    }

}
