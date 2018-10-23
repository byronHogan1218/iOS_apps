//
//  FilterViewController.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/8/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var veganBox: UIButton!
    @IBAction func veganCheck(_ sender: UIButton) {
       // let imageData = try! Data(contentsOf: #imageLiteral(resourceName: "unchecked-checkbox.png"))//(string: "unchecked-checkbox.png"))
        //let image = UIImage(data: imageData )
        let uncheckImage = UIImage(named: "unchecked-checkbox.png")
        let checkImage = UIImage(named: "checked-checkbox.png")
        let current = veganBox.currentImage
        if (checkImage != nil && (checkImage?.isEqual(uncheckImage))!) {
            print("buttonPress")
            let otherImage = UIImage(named: "checked-checkbox.png")
            veganBox.setImage(nil, for: .normal)
            veganBox.setImage(otherImage, for: .normal)
            //veganBox.backgroundImage(for: .normal)
            //veganBox.im
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


