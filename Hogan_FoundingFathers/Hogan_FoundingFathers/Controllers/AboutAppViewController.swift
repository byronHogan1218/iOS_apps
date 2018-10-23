//
//  AboutAppViewController.swift
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
 
 
 Purpose:     To provide a view controller for the AboutApp view
 
 ***************************************************************************************************/
import UIKit

class AboutAppViewController: UIViewController {

    //This function handles when the done button is pressed
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)//Dismisses the about app view
    }
    
    //This function handles when the about author button is pressed
    //It will navigate to the about author webView
    @IBAction func aboutAuthorButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AuthorViewController") as! AuthorViewController
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "About App"//sets the title of the view to About App

    }

 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
