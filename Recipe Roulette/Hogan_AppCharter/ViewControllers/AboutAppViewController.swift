//
//  AboutAppViewController.swift
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
 
 
 Purpose:     This a view controller to control the About App View
 
 NOTE:App Icon Image Source
 https://chefberry.wordpress.com/2016/12/07/recipe-roulette-its-whats-for-dinner/
 ***************************************************************************************************/




import UIKit
import MessageUI

class AboutAppViewController: UIViewController, MFMailComposeViewControllerDelegate {

    @IBAction func FeedbackButton(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail(){//Determines if the account can send email
            let mailComposeVC = MFMailComposeViewController()
            mailComposeVC.mailComposeDelegate = self
            
            let toRecipients = ["niucsci@gmail.com"]
            let emailTitle = "Recipe Roulette Feedback"
            let messageBody = "Feedback for Recipe Roulette, Version 1.0"
            
            mailComposeVC.setToRecipients(toRecipients)
            mailComposeVC.setSubject(emailTitle)
            mailComposeVC.setMessageBody(messageBody, isHTML: false)
            
            self.present(mailComposeVC, animated: true, completion: nil)
        }
            
        else{//Prints to the console that the machine cannot email
            print("Cannot send email")
        }
        
    }
    // This function displays the message string on the console
    // so that it can be tested to make sure if the email message was
    // cancelled, failed, saved draft or sent.
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        switch result.rawValue {
            
        case MFMailComposeResult.cancelled.rawValue:
            print("cancelled")
            
        case MFMailComposeResult.failed.rawValue:
            print("failed")
            
        case MFMailComposeResult.saved.rawValue:
            print("saved")
            
        case MFMailComposeResult.sent.rawValue:
            print("sent")
            
        default:
            break
            
        }
        // Dismiss the compose view controller after the ComposeVC
        // finishes.
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
