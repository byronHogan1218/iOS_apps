//
//  FilterTableViewController.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/12/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App Charter
 
 
 Purpose:     This a view controller to control the Filter Table View
 
 
 ***************************************************************************************************/
import UIKit


class FilterTableViewController: UITableViewController {
  
  
    //Array Order
    //Appetizer,Salad,Entrees,Dessert,Soup,Vegan,Vegetarian
    //cheap,Quick,veryHealthy,veryPopular,dairyFreee,glutenFree,PeanutFree
    //Sets a more managable name for the global filter array
  var filterArray = FilterArray.sharedInstance.filterArray
    
    var filterNames:[String] = ["Appetizers", "Salads", "Entrees", "Desserts", "Soups",  "Vegan", "Vegetarian",  "Quick Meals", "Dairy Free", "Gluten Free","Optional: Healthy Choice\n(Must use with other non-optional preferences)", "Optional: Popular Dishes\n(Must use with other non-optional preferences)", "Optional: Cheap\n(Must use with other non-optional preferences)"]

    //Used to help determine in a change was made
    var intialFilterCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Sets the row Height for each Cell
        self.tableView.rowHeight = 70
        //Counts the intial true values in the array
        for item in FilterArray.sharedInstance.filterArray{
            if item == true{
                intialFilterCount += 1
            }
        }
        addRightResetBarButton()

    }

    //This function adds an System button into the navagation bar
    func addRightResetBarButton() {
        
        // Create a system  button
        let button = UIButton(type: .system)
        //sets the postion and size o fthe button
        button.frame(forAlignmentRect: CGRect(x: 100, y: 100, width: 100, height: 50))
        //sets the title of the button
        button.setTitle("Reset", for: .normal)
        //sets what happens when the button is pressed,calls deleteEntitiy
        button.addTarget(self, action: #selector(self.resetFilters), for: .touchUpInside)
        
        // Place the button at the top right corner of the navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    //This function handles when the system button is pressed,resests the saved filters
    @objc func resetFilters() {
        
        // Create a title for the alert.
        let title = NSLocalizedString("Reset Filters", comment: "")
        
        // Create a message for the alert.
        let message = NSLocalizedString("This will resest all of the filters to their default value", comment: "")
        
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let okButtonTitle = NSLocalizedString("OK", comment: "")
        
        // Create a controller for the alert.
        let alertCotroller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create the two actions for the alert.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            //print("The \"OK/Cancel\" alert's cancel action occured.")
            print("The \"Cancel\" action accured.")
        }
        let okAction = UIAlertAction(title: okButtonTitle, style: .default) { _ in
            print("The \"OK\" action accured.")
            var i = 0
            while i < FilterArray.sharedInstance.filterArray.count{//Sets all of the values to false
                     FilterArray.sharedInstance.filterArray[i] = false
                i += 1
            }
            self.tableView.reloadData()//reloads to get rid of the checks
     
            if 0 < self.intialFilterCount{//reloads the data on the main view
                FilterArray.sharedInstance.countReduced = true
                FilterArray.sharedInstance.hasChanged = true
            }
        }
        
        // Add the actions to the alert controller. Order of exec is important.
        alertCotroller.addAction(cancelAction)
        alertCotroller.addAction(okAction)
        
        // Present the alert.
        present(alertCotroller, animated: true, completion: nil)
        
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FILTERCELL", for: indexPath) as! FilterTableViewCell
        
        if FilterArray.sharedInstance.filterArray[indexPath.row] == false {//Determines what picture the cell should output
                cell.checkboxImage.image = UIImage(named: "unchecked-checkbox.png")
            }
            else {
                cell.checkboxImage.image = UIImage(named: "checked-checkbox.png")
            }
    
        //Sets the size and position of the image to be the same
        cell.checkboxImage.frame = CGRect(x: 300, y: 15, width: 40, height: 40)
        
        
        //Changes the text of the cell
        cell.checkboxLabel.text = filterNames[indexPath.row]
        
        return cell
    }
 

    //This function is used to be able to tell when a cell is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //This allows the main view to know if any new prefernces were applied,reloads the current random recipe if a new prefernce is selected/unselected
       FilterArray.sharedInstance.hasChanged = true
      
        var temp = 0
        for item in FilterArray.sharedInstance.filterArray{//Counts the true values
            if item == true{
                temp += 1
            }
        }
        if temp < intialFilterCount{//Determines if the filters have gone down in size
            FilterArray.sharedInstance.countReduced = true
        }
        let index = (tableView.indexPathForSelectedRow?.item)!
        //Changes the array in this view controller
        filterArray[index] = !filterArray[index]
        //Changes the array in the main view controller
        FilterArray.sharedInstance.filterArray[index] = !FilterArray.sharedInstance.filterArray[index]
 
        //reloads the table with the new information
        tableView.reloadData()
        
    }

}

