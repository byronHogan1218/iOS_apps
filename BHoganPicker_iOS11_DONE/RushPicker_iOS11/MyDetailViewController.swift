//
//  MyDetailViewController.swift
//  RushPicker_iOS11
//
//  Created by Byron Hogan on 3/22/18.
//  Copyright © 2018 Kai Rush. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/22/18
 Assignment:  App 5
 
 
 Purpose:     To provide a view controller for the Detail view
 
 Answer to the question: If the picker view is not its own delegate, then the information in the picker cannot be changed.  It will show up as an unitialized varaible in the list
 ***************************************************************************************************/
import UIKit

class MyDetailViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    //Varaibles to hold the connections
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var isbn: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selectedOption: UIButton!
    
    //Varaibles to hold the passed data
    var tvPublisher:String!
    var tvISBN:String!
    var tvAuthor:String!
    var tvBookImage:String!
    
    //Array created for the picker list to use
    var buyOptions = ["Buy New","Buy Used","Rent"]
    
    //Handles the loading of the information on the detail view
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = tvAuthor
        
        bookImage.image = UIImage(named: tvBookImage)
        isbn.text = tvISBN
        publisher.text = tvPublisher
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.isHidden = true

    }
    
    //Makes the picker view only have one componenet
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Shows the picker view when the select option button is selected
    @IBAction func selectedOptionTouch(_ sender: UIButton) {
        if pickerView.isHidden == true{
            pickerView.isHidden = false
        }
    }
    
    //Sets the rows in the picker view equal to the count in the array
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return buyOptions.count
    }

    //Sets the rows equal to the items in the array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return buyOptions[row]
    }
    
    //Hides the picker view and makes the title of it the selected option
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedOption.setTitle(buyOptions[row], for: .normal)
        pickerView.isHidden = true
    }
}
