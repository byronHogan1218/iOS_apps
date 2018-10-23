//
//  DetailViewController.swift
//  RushPicker_iOS11
//
//  Created by Kai Rush on 3/21/18.
//  Copyright © 2018 Kai Rush. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var isbnLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectionOption: UIButton!
    
    // Variables to hold data passed from the TableViewController
    var tvBookImage:String!
    var tvPublisher:String!
    var tvPubYear:String!
    var tvAuthor:String!
    var tvISBN:String!
    
    // Setup data for the picker
    let buyOptions = ["Buy New","Buy Used","Rent"]
    
    @IBAction func selectionButton(_ sender: UIButton) {
        if pickerView.isHidden {
            pickerView.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true
        
        // Place data received from the TableViewController
        // on the view.
        navigationItem.title = tvAuthor
        imageView.image = UIImage(named: tvBookImage)
        publisherLabel.text = tvPublisher
        isbnLabel.text = tvISBN
        
    }

    // MARK - required pickerview delegate methods
    
    // This function tells the delegate that there is one
    // column in the picker view.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // This function tells the delegate that the number of rows
    // in the picker view is the number of elements in the
    // buyOptions array.
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return buyOptions.count
    }
    
    // This function uses the title for each row of the picker view
    // to be the name of each element from the buyOptions array.
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buyOptions[row]
    }
    
    // This function changes the selectionOption button (connected
    // as IBOutlet) to the element selected from the picker view.
    // It then hides the picker view.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectionOption.setTitle(buyOptions[row], for: .normal)
        pickerView.isHidden = true
    }
    
}
