//
//  MainViewController.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/5/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App Charter
 
 
 Purpose:     This a view controller to control the Main View
 
 
 ***************************************************************************************************/


import UIKit
import CoreData



class MainViewController: UIViewController {
    //Variables to connect to the outlets
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var RecipeName: UILabel!
    
    //Array Order
    //Appetizer,Salad,Entrees,Dessert,Soup,Vegan,Vegetarian
    //cheap,Quick,veryHealthy,veryPopular,dairyFreee,glutenFree,PeanutFree
    var filterArray = FilterArray.sharedInstance.filterArray
    
    //Varaible to hold the current recipe
    var recipeObject = [Recipe]()
    //Varaible to save the current recipe
    var recipeArray: [NSManagedObject] = []
    
    //Varaibles to be appended to the api request
  let searchTerms = ["appetizer", "salad", "entrees", "dessert", "soup",  "vegan", "vegetarian", "quick", "dairy+free", "gluten+free","healthy", "popular","cheap"]
    
  //This function runs every time MainViewController is shown
    override func viewWillAppear(_ animated: Bool) {
        if FilterArray.sharedInstance.hasChanged == true{//Determines if a search preference has changed
            for item in FilterArray.sharedInstance.filterArray{//Goes through the filter array and checks to see if there are any prefernces to search by
                if item == true{//found a changed value
                    //Get rid of all the old data
                    recipeObject.removeAll()
                    recipeImage.image = nil
                    RecipeName.text = ""
                    //get new data with new prefernces
                    fetchJasonData(noRecipe: false)
                    break//immediately quit because we found a true search preference
                }
            }
            if FilterArray.sharedInstance.countReduced == true{
                //Get rid of all the old data
                recipeObject.removeAll()
                recipeImage.image = nil
                RecipeName.text = ""
                //get new data with new prefernces
                fetchJasonData(noRecipe: false)
            }
            //Reset the preference has changed back to false
            FilterArray.sharedInstance.hasChanged = false
            FilterArray.sharedInstance.countReduced = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //Get initial recipe
            fetchJasonData(noRecipe: false)
        
        
    }
    
    //This Code runs everytime the user presses the next button(The red x)
    @IBAction func NextTouch(_ sender: UIButton) {
        //Gets rid of the old data
        recipeImage.image = nil
        RecipeName.text = ""
        recipeObject.removeAll()
        
        //Prints to console to know when next button is pressed
        print("Getting the new data by next button")
        
        //Get new data to output
        fetchJasonData(noRecipe: false)
    }
    
    //This Code runs everytime the user presses the like button(The green check)
    @IBAction func LikeItTouch(_ sender: UIButton) {
        //Get Variables ready to be saved
        let titleToSave = self.recipeObject[0].title
        let ratingToSave = self.recipeObject[0].rating
        let readyInMinutesToSave = self.recipeObject[0].readyInMinutes
        let imageURLToSave = self.recipeObject[0].imageURL
        let sourceNameToSave = self.recipeObject[0].sourceName
        let servingsToSave = self.recipeObject[0].servings
        let websiteURLToSave = self.recipeObject[0].websiteURL

        
//call save and passes the information to be saved
        self.save(title:titleToSave!,rating:ratingToSave!, readyInMinutes:readyInMinutesToSave!, imageURL: imageURLToSave!, sourceName: sourceNameToSave!, servings:servingsToSave!, website: websiteURLToSave!)
        
        //Gets rid of the old data that was just saved
        recipeImage.image = nil
        RecipeName.text = ""
        recipeObject.removeAll()
        
        //Prints to the console to know when the like button was pressed
        print("Getting the new data by like button")
        
        //Get new data to output
        fetchJasonData(noRecipe: false)
    }
    
    
    //This is where the recipes that the user wants to keep are saved into memory
    func save(title:String,rating:Int, readyInMinutes:Int, imageURL: String, sourceName: String, servings:Int, website: String) {
        //Prints to knon when the beggining of save is
      print("BEGINNING OF SAVE")
        //Sets up the appDelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
   
        //Creates the temporary place to save to before commiting to memory
        let managedContext = appDelegate.persistentContainer.viewContext

       //Defines the place that the managed context wil be saved to
        let recipeEntitiy = NSEntityDescription.entity(forEntityName: "SavedRecipes", in: managedContext)!

        //creates the object to append to to save the data
        let recipe = NSManagedObject(entity: recipeEntitiy, insertInto: managedContext)

        // Set the attributes using key-value coding
            recipe.setValue(title, forKey: "title")
            recipe.setValue(imageURL, forKey: "imageURL")
            recipe.setValue(rating, forKey: "rating")
            recipe.setValue(readyInMinutes, forKey: "readyInMinutes")
            recipe.setValue(servings, forKey: "servings")
            recipe.setValue(sourceName, forKey: "sourceName")
            recipe.setValue(website, forKey: "websiteURL")

     
        //Commits the managed context and the object to be saved to the entity
        do {
            try managedContext.save()
            recipeArray.append(recipe)
        }
        catch let error as NSError {//Checks for an error
            print("COULD NOT SAVE. \(error), \(error.description)")
        }
        //Prints to the console when we are finished saving
        print("WE HAVE SAVED")
    }

    
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
            var i = 0
            while i < FilterArray.sharedInstance.filterArray.count{//Sets all the search parameter back to false
                FilterArray.sharedInstance.filterArray[i] = false
                i += 1
            }
        }
        
        // Add the dismiss/cancel action to the alert controller.
        alertController.addAction(cancelAction)
        
        // Present the alert controller.
        present(alertController, animated: true, completion: nil)
        
        
    }
    
        //This function submits a url request to get the json formatted datafrom the source as indicated in url string.
    func fetchJasonData(noRecipe: Bool) {
            //looping conditionals
            var i = 0
            var j = 0
            //Array to hold the code for which search parameters to append to the api request
           var codeArray = [Int]()
        
            while i < FilterArray.sharedInstance.filterArray.count{//Loops trough filterArray to find the true values(the search parameters to apply)
                if FilterArray.sharedInstance.filterArray[i] == true{//Determines if the code(aka index) should be appended to code array
                        if !codeArray.contains(i){//checks to see if codeArray already contains the code(aka index)
                            codeArray.append(i)
                        }
                }
                i += 1//update loop
            }
        
            //Create the prefix for the api request
            var apiString = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?number=1"
       
            var codeForSearch = 0
            if !codeArray.isEmpty {//Determines if there is any search parameters to append to apiString
                apiString.append("&tags=")//Allows the API request to have search parameters
                while j < codeArray.count{//loop through countArray,appending the appropriate search terms(defined at start)
                    codeForSearch = codeArray[j]
                    apiString.append(searchTerms[codeForSearch])
                    if codeArray[j] != codeArray.last{//Determines if this is the last item being appended
                        apiString.append("%2C")//If not last item,append the code to add another search parameter
                    }
                    j += 1//update loop
                }
                //apiString.append("&number=1")//Appends the postface for the api request
            }else{//This code runs if there are no search preferences
                //apiString.append("number=1")//Appends the postface for the api request
            }
        
        if noRecipe == true{//Determines if a recipe exists that fits the search preferences
            apiString = "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/random?number=1"
        }
     
        
//THis code is used when not wanting tomake an api request,used for testing purposes as I get a limited amount of free requests per day
/***********************************************************************************************/
/*
            let title = "Honeyed Sweet Potatoes Made with Love and Old fashioned elbow grease"
            let creditText = "Vegetarian Times"
         //   let instructions = "Preheat oven to 350°F. Place potato and apple chunks in 13- x 9-inch baking dish, and drizzle with oil and honey. Sprinkle with cinnamon, and season with salt, if desired. Cover with foil, and bake 30 minutes. Remove foil, and bake 30 minutes more, or until very tender. Cool 5 minutes. Transfer mixture to food processor, and purée until smooth."
            let url = "http://www.vegetariantimes.com/recipe/honeyed-sweet-potatoes/"
            let urlToImage = "https://spoonacular.com/recipeImages/757898-556x370.jpg"
            let readyInMinutes = 30
            let servings = 10
            let rating = 40


            self.recipeObject.append(Recipe(title: title, rating: rating , sourceName: creditText , imageURL: urlToImage, readyInMinutes: readyInMinutes, servings: servings, websiteURL: url))
            let imageString = self.recipeObject[0].imageURL//String version of the URL
            let imageURL:URL = URL(string:imageString!)!//Converts the string to a URL
            let imageData:NSData = NSData(contentsOf: imageURL)!//Gets the data from the URL
            let image = UIImage(data: imageData as Data)//Gets the image from the data
            DispatchQueue.main.async {
                self.RecipeName.text = self.recipeObject[0].title
                self.recipeImage.image = image
                
            }
  */
/***********************************************************************************************/
           // This is code to make a api request,uncomment for the full app
/***********************************************************************************************/
        //   /*
            //This is the URL for the api request to follow
             guard let api_url = URL(string:apiString) else {return}
            
            //Create a URL request with the API address
            var urlRequest = URLRequest(url: api_url)
            
            //Sends the API key with the request
            urlRequest.setValue("6gS7jUY15CmshRKGDzLzghgjkJFrp1mYhdajsnFOBo1K9rwtx5", forHTTPHeaderField: "X-Mashape-Key" )
          
            //Submit a request to get the JSON data
            let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in

                
                // If there is an error, print the error and do not continue
                if error != nil {
                    print(error!)
                    return
                } // end of error if
                // If there is no error, fetch the json formatted content
                if let content = data {
                    do {
                        let jsonObject = try JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                       
                        
                        
                        //Fetch the error code, if there was one, to let us know that we didnt find a recipe
                        let errorCode = jsonObject["code"] as! Int?
                      
                        if errorCode != nil {//Determines if there is an error code
                            if errorCode == 400{//error code 400 means no recipe found
                                //call an alert to inform the user of the error
                                self.displaySimpleAlert(titleString: "NO RECIPE FOUND", messageString: "Alter your search preferences to broaden your random recipe search. Reseting Search Preferences")
                                
                                //print to the console that and error occured
                                print("ERROR:There are no recipes found with search preference choices,reseting preferences")
                                //recall fetchJasonData and pass in true to reload the data with a random recipe
                                self.fetchJasonData(noRecipe: true)
                                return//returns to avoid a recursive call
                            }
                        }

                        
                        
                        
                        
                        // Fetch only the recipes
                        if let recipesJson = jsonObject["recipes"] as? [[String:AnyObject]] {
                            for eachRecipe in recipesJson
                            {
                              if let title = eachRecipe["title"] as? String, let creditText = eachRecipe["creditText"] as? String, let _ = eachRecipe["instructions"] as? String, let url = eachRecipe["sourceUrl"] as? String, let urlToImage = eachRecipe["image"] as? String, let rating = eachRecipe["spoonacularScore"] as? Int, let readyInMinutes = eachRecipe["readyInMinutes"] as? Int, let servings = eachRecipe["servings"] as? Int{
                                //Use to output infomration to the console
                                    //print("*****MARK:BEGIN*****")
                                    //print("TITLE:", title,"\n", "Credits:", creditText, "\n", "INSTRUCTIONS:", instructions,"\n", "URL:", url, "\n", "URL TO IMAGE:", urlToImage)
                                   // print("*****MARK:END*****")
                                
                                     //Builds the recipe class array
                                    self.recipeObject.append(Recipe(title: title, rating: rating , sourceName: creditText , imageURL: urlToImage, readyInMinutes: readyInMinutes, servings: servings, websiteURL: url))
                            
                                    
                                
                                    let imageString = self.recipeObject[0].imageURL//String version of the URL
                                    let imageURL:URL = URL(string:imageString!)!//Converts the string to a URL
                                    let imageData:NSData = NSData(contentsOf: imageURL)!//Gets the data from the URL
                                    let image = UIImage(data: imageData as Data)//Gets the image from the data
                                    DispatchQueue.main.async {//Breaks from the task to update the image and label
                                        self.RecipeName.text = self.recipeObject[0].title
                                        self.recipeImage.image = image
                                    }
                                } // end the inner "if"statement
                            } //end the for loop
                        } //end the outer "if" statement
                    } // end the "do" loop
                    catch { print(error) }
                } // end if
                
            }//end of task
            task.resume()
// */
/***********************************************************************************************/
 } // end readJasonData

}
