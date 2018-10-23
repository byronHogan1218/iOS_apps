//
//  ViewController.swift
//  hoganWelcome
//
//  Created by Byron Hogan on 1/23/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayName: UILabel!
    
    @IBAction func buttonTouch(_ sender: UIButton) {
        if (sender.currentTitle == "CSCI321")
        {
            displayName.text = "Welcome iOS UNDERGRADUATE students 😃😃😃"
            displayImage.image = #imageLiteral(resourceName: "ustudents.jpg")
        }
        if (sender.currentTitle == "CSCI521")
        {
            displayName.text = "Welcome iOS GRADUATE students 😛😛😛"
            displayImage.image = #imageLiteral(resourceName: "gstudents.jpg")
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

