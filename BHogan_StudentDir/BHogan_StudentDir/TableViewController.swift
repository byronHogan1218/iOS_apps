//
//  TableViewController.swift
//  BHogan_StudentDir
//
//  Created by Byron Hogan on 3/27/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App 6
 
 
 Purpose:     To provide a view controller for the table view
 NOTE:Comment out lines 130-132(the lines with the if statement) if the image9.jpg issue is resolved after this is turned in
 ***************************************************************************************************/
import UIKit


class TableViewController: UITableViewController {

    //array of student objects
    var studentObject = [Student]()
    
    //Structure used for the decoding of the JSON data
    struct StudentStruct: Decodable {
        let id:Int?
        let firstName:String?
        let lastName:String?
        let title:String?
        let phone:String?
        let email:String?
        let course:String?
        let term:String?
        let year:Int?
        let imageURL:String?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set fixed height for tableview cell.
        self.tableView.rowHeight = 100
        
        // Add Info light button to navigate to the AboutApp view
        addRightNavigationBarInfoButton()
        
        loadJSON() // call user-defined function to load json data
    
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
    // This function makes a request to load json file from the indicated URL.
    func loadJSON() {
        let jsonURL = "http://faculty.cs.niu.edu/~krush/ios/rushStudents-json"
        guard let url = URL(string: jsonURL) else{ return }
        
        URLSession.shared.dataTask(with: url) { (data,response, err) in
            
            guard let jsonData = data else { return }
            
            // To view data as string before parsing.
            //let stringData = String(data: jsonData,encoding: .utf8)
            //print(stringData)
            
            do {
                let students = try JSONDecoder().decode([StudentStruct].self, from: jsonData)
                //print(students) // To view “students”after parsing/decoding
                
                for eachStudent in students {
                    
                    //builds the student class array
                    self.studentObject.append(Student(id: eachStudent.id!, firstName: eachStudent.firstName!, lastName: eachStudent.lastName!, title: eachStudent.title!, phone: eachStudent.phone!, email: eachStudent.email!, course: eachStudent.course!, term: eachStudent.term!, year: eachStudent.year!, imageURL: eachStudent.imageURL!))
                
                    //print(eachStudent.firstName!, eachStudent.lastName as String! + ",", eachStudent.course as String! + ",", eachStudent.year as Int!)
                }
                
            } catch let jsonErr {
                print ("Error Reading JSON: ", jsonErr)
            }
            DispatchQueue.main.async {//Reloads the table everytime a new cell is loaded
                self.tableView.reloadData()
            }
            }.resume() //URLSession
     
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
        return studentObject.count
    }
    
    // This function displays cell image, cell title and subtitle
    // on the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let student:Student = studentObject[indexPath.row]
        
        // Assign a table view cell with the TableViewCell class
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell

        let imageString = student.imageURL//String version of the URL
//        if student.imageURL == "http://faculty.cs.niu.edu/~krush/ios/rs-images/image9.jpg"{//Checks for the incorrect data and changes it to the correct data
//            imageString =  "http://faculty.cs.niu.edu/~krush/ios/rs-images/image9.jpeg"
//            }
        let imageURL:URL = URL(string:imageString!)!//Converts the string to a URL
        let imageData:NSData = NSData(contentsOf: imageURL)!//Gets the data from the URL
        let image = UIImage(data: imageData as Data)//Gets the image from the data
        
        // Place cell image, Student name and Year in the table cell
        cell.cellImage.image = image
        let studentName = student.firstName! + " " + student.lastName!
        cell.cellTitle.text = studentName
        let yearString = String(describing: student.year!)
        cell.cellSubtitle.text = yearString
        
        return cell
    }
    
  
    

    
    // MARK: - Navigation
    
    // Prepare to pass data to the detail view.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Identifies the DetailViewController as the destination view controller
        if (segue.identifier == "SHOWDETAIL") {
            let destVC = segue.destination as! DetailViewController
            
            // Prepare to send Student information to the
            // DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let student:Student = studentObject[indexPath.row]
           
                
                //Sends data to the destinnation view controller
                destVC.navigationItem.title = student.firstName! + " " + student.lastName!
                destVC.studentImage = student.imageURL!
                destVC.studentTitle = student.title!
                let idString = String(describing: student.id!)//Converts Int to String
                destVC.studentID = idString
                destVC.studentNumber = student.phone!
                destVC.studentTerm = student.term!
                let yearString = String(describing: student.year!)//Converts Int to String
                destVC.studentYear = yearString
                destVC.studentEmail = student.email!
                destVC.studentCourse = student.course!
                

                
                
            } // end if
        } // end if
    }
    
}


