//
//  TableViewController.swift
//  Hogan_FoundingFathers
//
//  Created by Byron Hogan on 2/15/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/22/18
 Assignment:  App 3
 
 
 Purpose:     To provide a view controller for the Table view
 
 ***************************************************************************************************/
import UIKit

class TableViewController: UITableViewController {

    //Instantiate arry of objects to hold the FFather objects
    var ffatherObject = [FFather]()
    
    // As the main view loads, let the row height to fixed number,
    // add an info button to navigate to the "About App" view,
    // then locate, load and display the contain from the
    // property list.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set fixed height for tableview cell.
        self.tableView.rowHeight = 100
        
        // Add Info light button to navigate to the AboutApp view
        addRightNavigationBarInfoButton()
        
        // Locate the property list and load its content.
        readPropertyList()
        
        
    }
    
    //This function adds an Info button into the navagation bar
    func addRightNavigationBarInfoButton() {
        
        // Create an Info Light button
        let button = UIButton(type: .infoDark)
        button.addTarget(self, action: #selector(self.showAboutAppViewController), for: .touchUpInside)
        
        // Place the button at the top right corner of the navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    //This function handles when the info button is pressed,loads the about author
    @objc func showAboutAppViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AboutAppNavigationController") as! UINavigationController
        self.present(controller, animated: true, completion: nil)
        
    }
    
    
    /*  This function finds the property list and load the root array that contains dictionaries.  It then extracts elements in each dictionary into an array of object of FFather class that is defined in the FFather.swift file.
     */
    func readPropertyList() {
        let path = Bundle.main.path(forResource: "FoundingFathers", ofType: "plist")!
        let ffatherArray:NSArray = NSArray(contentsOfFile:path)!
        
        for item in ffatherArray {//Loop through each item in the array
            
            //Convert item of type Any into a dictionary.
            let dictionary: [String:String] = (item as? Dictionary)!
           
            
            //Using dictionary, extract the data from the plist and append it to the FFatherObject
            let ffather_number = dictionary["Number"]
            let ffather_name = dictionary["Name"]
            let ffather_title = dictionary["Title"]
            let ffather_years = dictionary["Years"]
            let ffather_spouse = dictionary["Spouse"]
            let ffather_party = dictionary["Party"]
            let cell_image = dictionary["cell_image"]
            let ffatherImage = dictionary["Image"]
            ffatherObject.append(FFather(number: ffather_number!, name: ffather_name!, title: ffather_title!, year: ffather_years!, spouse: ffather_spouse!, party: ffather_party!, cellImage: cell_image!, ffatherImage: ffatherImage!))
        }
    }
    
    
    // MARK: - Table view data source methods (required)
    
    // This function tells the tableview controller how many
    // sections we will have on the table view.
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // This function indicates the number of rows to be displayed
    // on the table view.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return the number of rows in parkObject
        return ffatherObject.count
    }
    
    // This function displays cell image, cell title and subtitle
    // on the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let ffather:FFather = ffatherObject[indexPath.row]
        
        // Assign a table view cell with the TableViewCell class
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
        // Place cell image, FFather name and Title in the table cell
        let cellImageName = UIImage(named: ffather.cellImage)
        cell.CellImage.image = cellImageName
        cell.CellTitle.text = ffather.name
        cell.CellSubTitle.text = ffather.title
        return cell
    }
    
    
    
    // MARK: - Navigation
    
    // Prepare to pass data to the detail view.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Identifies the DetailViewController as the destination view controller
        if (segue.identifier == "SHOWDETAIL") {
            let destVC = segue.destination as! DetailViewController
            
            // Prepare to send FFather information to the 
            // DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let ffather:FFather = ffatherObject[indexPath.row]
                destVC.navigationItem.title = ffather.name
                destVC.tvffatherImage = ffather.ffatherImage
                destVC.tvnameLabel = ffather.name
                destVC.tvtitleLabel = ffather.title
                destVC.tvyearLabel = ffather.year
                destVC.tvspouseLabel = ffather.spouse
                destVC.tvpartyLabel = ffather.party
                
                
            } // end if
        } // end if
    }

}
