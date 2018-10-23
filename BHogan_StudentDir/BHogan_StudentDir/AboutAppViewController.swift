//
//  AboutAppViewController.swift
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
 
 
 Purpose:     To provide a view controller for the About App view
 
 ***************************************************************************************************/
import UIKit

class AboutAppViewController: UIViewController {

  
    @IBAction func DonePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)//Dismisses the about app view
    }
   
    //Handles when the about aithor button is pressed
    @IBAction func aboutAuthorButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AboutAuthorViewController") as! AboutAuthorViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "About App"//sets the title of the view to About App
    
    }

}
