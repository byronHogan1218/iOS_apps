//
//  AuthorViewController.swift
//  Hogan_PrimesFinder
//
//  Created by Byron Hogan on 2/11/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//

/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/15/18
 Assignment:  Assignment3
 
 
 Purpose:     Provide a view controller for the author view
 
 ***************************************************************************************************/

import UIKit
import WebKit

class AuthorViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //Change the title of the author page to my name
        navigationItem.title = "Byron Hogan"
        /* Create a path to fetch the content/data of the index.html file located in
         the project app bundle. */
        let path = Bundle.main.path(forResource: "html/index", ofType: "html")!
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
        
        // Load the content of the index.html file onto the webView
        webView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
    }

 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
