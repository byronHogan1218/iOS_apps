//
//  TableViewController.swift
//  RushPicker_iOS11
//
//  Created by Kai Rush on 3/21/18.
//  Copyright © 2018 Kai Rush. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //Instantiate array of objects to hold the Book objects
    var bookObject = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 150
        
        // Locate the property list and load its content.
        readPropertyList()
        
    }

    /*  This function finds the property list and load the root array that contains dictionaries.  It then extracts elements in each dictionary into an array of object of Park class that I defined in the Park.swift file.
     */
    func readPropertyList() {
        let path = Bundle.main.path(forResource: "BookList", ofType: "plist")!
        let bookArray:NSArray = NSArray(contentsOfFile:path)!
//        print("\(bookArray)")
//        print(bookArray.count)
        
        for item in bookArray {
            //item is of type Any Object and it cannot be used
            //as a subscripted dictionary with value-key pair.
            //Therefore, I need to convert item into a dictionary.
            let dictionary: [String: String] = (item as? Dictionary)!

            //Next, use "dictionary" to extract each attribute
            //in the dictionary before appending them in the
            //parkObject.
            let bTitle = dictionary["title"]
            let bAuthor = dictionary["author"]
            let isbn = dictionary["ISBN"]
            let bImage = dictionary["book_image"]
            let publisher = dictionary["publisher"]
            let pubYear = dictionary["pub_year"]

            bookObject.append(Book(title: bTitle!, author: bAuthor!, isbn: isbn!, bookImage: bImage!, publisher: publisher!, pubYear: pubYear!))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return bookObject.count
    }
    
    // This function displays cell image, cell title and subtitles
    // on the table view.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let book:Book = bookObject[indexPath.row]
        
        // Assign a table view cell with the TableViewCell class
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
        
        // Place cell image, book title, author, and year in the table cell
        let cellImageName = UIImage(named: book.bookImage)
        cell.cellImage.image = cellImageName
        cell.cellTitle.text = book.title
        cell.cellSubTitle.text = book.author
        cell.cellYear.text = book.pubYear
        return cell
    }
    
    // MARK: - Navigation
    
    // Prepare to pass data to the detail view.
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // First identify the DetailViewController as the destination view controller
//        if (segue.identifier == "BOOK") {
//            let destVC = segue.destination as! DetailViewController
//
//            // DetailViewController
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//
//                let book:Book = bookObject[indexPath.row]
//                destVC.tvPublisher = book.publisher
//                destVC.tvISBN = book.isbn
//                destVC.tvAuthor = book.author
//                destVC.tvBookImage = book.bookImage
//
//            } // end if
//        } // end if
//    }

}
