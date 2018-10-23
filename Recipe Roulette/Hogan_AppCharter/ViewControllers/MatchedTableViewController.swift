//
//  MatchedTableViewController.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/8/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App Charter
 
 
 Purpose:     This a view controller to control the Matched Table View
 
 
 ***************************************************************************************************/
import UIKit
import CoreData

class MatchedTableViewController: UITableViewController {
 
    //Holds the data the is loaded
    var recipeObject = [Recipe] ()
    //Holds the data that was saved
    var recipes: [NSManagedObject] = []
  
    
    override func viewDidLoad() {
       
        super.viewDidLoad()

        //This adds a button to delete the saved recipes
        addRightDeleteBarButton()
        
       //Sets the height of each cell
        self.tableView.rowHeight = 135
        
     

    }

    // This function will fetch data from CoreData.
    override func viewDidAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
       
       
        //Using the application Delegate, get a reference to the persistent container and manajed object context
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let manageContext = appDelegate.persistentContainer.viewContext
        
        /* NSFetchRequest is the class responsible for fetching data from CoreData. Fetch requests have several qualifiers used to refine the set of results returned. Here, we use NSEntityDescription to fetch ALL objects in the Person entity. */
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName:"SavedRecipes")
        
       //Catch error that might occur
        do {
            recipes = try manageContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("COULD NOT FETCH. \(error), \(error.description)")
        }
    
        self.tableView.reloadData()
        if recipes.isEmpty{//Determines if the table is not empty
            let title = "Your Matches Are Empty"
            let message = "Try finding some recipes that you might enjoy"
            //Calls an alert so the user does not have to press the back button on an empty page
            displaySimpleAlert(titleString: title, messageString: message)
            print ("EMPTY")
        }
        
    } // end viewDidAppear

    func displaySimpleAlert(titleString: String, messageString: String){
        // Create a title for the alert.
        let title = NSLocalizedString(titleString, comment: "")
        
        // Create a message for the alert.
        let message = NSLocalizedString(messageString, comment: "")
        // Create a local string "OK" to put on the alert.
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        // Create an dismiss/cancel action after the user pressed the OK button
        // on the alert view and print what happened on the console.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            print("The Simple alert's cancel action occured.")
            //Navigates the view back to the main view controller
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "mainVCnav") as! UINavigationController
            self.present(controller, animated: true, completion: nil)
        }
        
        // Add the dismiss/cancel action to the alert controller.
        alertController.addAction(cancelAction)
        
        // Present the alert controller.
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    //This function adds a system button into the navagation bar
    func addRightDeleteBarButton() {
        
        // Create a system  button
        let button = UIButton(type: .system)
        //sets the postion and size o fthe button
        button.frame(forAlignmentRect: CGRect(x: 100, y: 100, width: 100, height: 50))
        //sets the title of the button
        button.setTitle("Delete All", for: .normal)
        //sets what happens when the button is pressed,calls deleteEntitiy
        button.addTarget(self, action: #selector(self.deleteEntity), for: .touchUpInside)
        
        // Place the button at the top right corner of the navigation bar
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    //This function handles when the system button is pressed,deletes all saved recipes
    @objc func deleteEntity() {
        
            // Create a title for the alert.
            let title = NSLocalizedString("Delete Recipes", comment: "")
            
            // Create a message for the alert.
            let message = NSLocalizedString("Are you sure you would like to delete all of the Matched Recipes. Deleted recipes cannot be viewed.", comment: "")
            
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
                print("Starting to delete")
                //Deletes all the data held in the entity
                guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
                let managedContext = appDelegate.persistentContainer.viewContext
                let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: "SavedRecipes")
                let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
                do { try managedContext.execute(DelAllReqVar)}
                catch { print(error) }
                print("Finished deleting")
                
                //Gets rid of the data that was already loaded
                self.recipes.removeAll()
                self.tableView.reloadData()
                //calls the simple alert to let the user know that the delte was successful and to move back to the main view controller
                self.displaySimpleAlert(titleString: "Succesfully Deleted", messageString: "Let's continue finding more recipes to enjoy")
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
  
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //aRecipe is the entry in the entity to be loaded
        let aRecipe = recipes[indexPath.row]
        
        //Create the recipeobjectArray from appending the entitiy objects to them
        self.recipeObject.append(Recipe(title: aRecipe.value(forKey: "title") as! String, rating: aRecipe.value(forKey: "rating") as! Int , sourceName: aRecipe.value(forKey: "sourceName") as! String , imageURL: aRecipe.value(forKey: "imageURL") as! String, readyInMinutes: aRecipe.value(forKey: "readyInMinutes") as! Int, servings: aRecipe.value(forKey: "servings") as! Int, websiteURL: aRecipe.value(forKey: "websiteURL") as! String))
        
        
        
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as! TableViewCell
     
        
        let imageString = recipeObject[indexPath.row].imageURL
        let imageURL:URL = URL(string:imageString! )!//Converts the string to a URL
        let imageData:NSData = NSData(contentsOf: imageURL)!//Gets the data from the URL
        let image = UIImage(data: imageData as Data)//Gets the image from the data
        //Sets the image of the cell
        cell.cellImage.image = image
        
        //Sets the title of the cell
        cell.cellTitle.text = recipeObject[indexPath.row].title
        
     //Builds the string to be outputed for the subtitle
        let subTextPreface = "Ready in "
        let readyInMinutesString = String(describing: recipeObject[indexPath.row].readyInMinutes!)
        let subTextPostface = " minutes"
        let subText = subTextPreface + readyInMinutesString + subTextPostface
    //Sets the subtitle
        cell.cellSubtitle.text = subText


        return cell
    }
 
    // Prepare to pass data to the detail view.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Identifies the DetailViewController as the destination view controller
        if (segue.identifier == "SHOWMATCHED") {
            let destVC = segue.destination as! MatchedDetailViewController
            
            // Prepare to send Recipe information to the DetailViewController
            if let indexPath = self.tableView.indexPathForSelectedRow {
                
                let recipe:Recipe = recipeObject[indexPath.row]
                destVC.navigationItem.title = recipe.title
                destVC.imageURL = recipe.imageURL
                destVC.websiteURL = recipe.websiteURL
                destVC.sourceName = recipe.sourceName
                destVC.rating = recipe.rating
                destVC.readyInMinutes = recipe.readyInMinutes
                destVC.servings = recipe.servings
                
                
                
            } // end if
        } // end if
    }
}

