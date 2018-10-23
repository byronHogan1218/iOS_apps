//
//  AuthorViewController.swift
//  Hogan_FoundingFathers
//
//  Created by Byron Hogan on 2/19/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/22/18
 Assignment:  App 3
 
 
 Purpose:     To provide a view controller for the AboutAuthor view
 
 ***************************************************************************************************/
import UIKit
import WebKit

class AuthorViewController: UIViewController {

    @IBOutlet weak var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "About Author"//sets title to About Author
        
        // Create a path to the index.html "data" file bundled under the "html" folder
        let path = Bundle.main.path(forResource: "html/index", ofType: "html")!
        let webData: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: webData, encoding: String.Encoding.utf8.rawValue)
        
        // Load the webView outlet with the content of the index.html file
        self.myWebView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)

    }

    
    


}
