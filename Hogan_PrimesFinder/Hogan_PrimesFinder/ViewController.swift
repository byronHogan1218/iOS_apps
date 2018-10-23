//
//  ViewController.swift
//  Hogan_PrimesFinder
//
//  Created by Byron Hogan on 2/7/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//

/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/15/18
 Assignment:  Assignment3
 
 
 Purpose:     Provide a view controller for the main view of the app
 
 ***************************************************************************************************/
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var primeCountLabel: UILabel!
    @IBOutlet weak var primeListText: UITextView!
    @IBOutlet weak var enterPrime: UITextField!
    @IBOutlet weak var targetPrime: UITextField!
    
    
    /////////////////////////////////////////////////////////////////////////
    //    This Function calculates all the prime numbers up to the number entered
    /////////////////////////////////////////////////////////////////////////
    func calculatePrimes(maxInt: Int) -> Void{
        //var maxInt = 100//This is the amount that we want to go up to,if needed for hardcoding
        var primeAr = Array<Bool> ()
        var i = 0
        while i <= maxInt {//fills the array with true values
            primeAr.append( true )
            i += 1
        }
        primeAr[0] = false//makes zero not a prime
        primeAr[1] = false// makes 1 not a prime
        i = 2
        var temp = 0
        var cnt = 1
        while i <= Int(sqrt(Double(maxInt))){
            if primeAr[i] == true{
                temp = (i * i)
                cnt = 1//reset count
                while temp <= maxInt{//Counts out all the mutiples of the prime numbers and makes them false
                    primeAr[temp] = false
                    temp = (i * i) + (i * cnt)
                    cnt += 1
                }
            }
            i += 1
        }
        var primeCnt = 0
        i = 0
        while i <= maxInt{//Counts the total amount of primes found
            if primeAr[i] == true{
                primeCnt += 1
            }
            i += 1
        }
        var firstTime = true
        i = 0
        
        //Prints to the label the amonut of primes found
        self.primeCountLabel.text = ("The total amount of prime numbers found for \(maxInt) is: \(primeCnt)")
        
        //Prints to the console the amount of primes found
        print("The total amount of prime numbers found for", maxInt, "are:", primeCnt)
        
        //Starts building the string of all the prime numbers found
        var primeString = "[ "
        
        //Starts printing to the console all of the primes
        print ("", "[" , separator: " ", terminator: "")
        
        while i <= maxInt{//prints all the prime numbers in a "[ x,y,...,z ]" format to console
            if primeAr[i] == true {
                if firstTime == true{
                    primeString = primeString + "\(i) "//adds the prime to the string to be output
                    print ("", i , separator: " ", terminator: "")
                    firstTime = false
                }
                else{
                    primeString = primeString + ",\(i) "//adds the prime to the string to be output
                    print ("", i , separator: ",", terminator: "")
                }
            }
            i += 1
        }
        
        //Finishes the prime string that will be output to user
        primeString = primeString + "]"
        
        //Prints the output to the text field
        self.primeListText.text = ("\(primeString)")
        
        //Prints the end of the primes to the console
        print ("", "]" , separator: " ", terminator: "")
    }
/////////////////////////////////////////////////////////////////////////
//    This Function handles the clear buttin action
/////////////////////////////////////////////////////////////////////////
    @IBAction func clearButton(_ sender: UIButton) {
        targetPrime.text = ( "25" )
        primeListText.text = ( "" )
        primeCountLabel.text = ("" )
    }
    
/////////////////////////////////////////////////////////////////////////
//    This Function handles the Find button action
/////////////////////////////////////////////////////////////////////////
    @IBAction func buttonTouch(_ sender: UIButton) {
        //Have the keyboard dismissed
        targetPrime.resignFirstResponder()
       

        let maxInt:Int = Int(targetPrime.text!)!
        
        //Determines if the value entered is valid
        if maxInt < 25{//Invalid entry,displays an alert
            displaySimpleAlert()
        }
        else{//Calculates the Primes and displays is
            calculatePrimes(maxInt: maxInt)
        }
    }

    func displaySimpleAlert(){
        // Create a title for the alert.
        let title = NSLocalizedString("Invalid", comment: "")
        
        // Create a message for the alert.
        let message = NSLocalizedString("Enter a number 25 or higher", comment: "")
        // Create a local string "OK" to put on the alert.
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message , preferredStyle: .alert)
        
        // Create an dismiss/cancel action after the user pressed the OK button
        // on the alert view and print what happened on the console.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .cancel) { _ in
            print("The Simple alert's cancel action occured.")
        }
        
        // Add the dismiss/cancel action to the alert controller.
        alertController.addAction(cancelAction)
        
        // Present the alert controller.
        present(alertController, animated: true, completion: nil)
    
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       //This calls a function that dissmisses the keyboard when tapped outside of keyboard
       self.hideKeyboardWhenTappedAround()
    }

}

// This extension function dismisses the keyboard when tapping
// anywhere on the view.
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
