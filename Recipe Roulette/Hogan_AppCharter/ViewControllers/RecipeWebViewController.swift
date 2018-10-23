//
//  RecipeWebViewController.swift
//  Hogan_AppCharter
//
//  Created by Byron Hogan on 4/15/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App Charter
 
 
 Purpose:     This a view controller to control the Matched Recipe Web View
 
 
 ***************************************************************************************************/
import UIKit
import WebKit

class RecipeWebViewController: UIViewController {
    @IBOutlet weak var WebView: WKWebView!
    
    var websiteString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    // Create a URL string object and initialize it to
    // the string passed from the detail VC.
        let myURL = URL(string: websiteString)
    
    // Create a request with the URL string.
        let urlRequest = URLRequest(url: myURL!)
    
    // Load the website with the URL request.
        WebView.load(urlRequest)
    }
}
