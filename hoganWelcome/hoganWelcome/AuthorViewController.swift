//
//  AuthorViewController.swift
//  hoganWelcome
//
//  Created by Byron Hogan on 1/25/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//

import UIKit
import WebKit
class AuthorViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Byron Hogan"
        /* Create a path to fetch the content/data of the index.html file located in
         the project app bundle. */
        let path = Bundle.main.path(forResource: "html/index", ofType: "html")!
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
        
        // Load the content of the index.html file onto the webView
        webView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
        // Do any additional setup after loading the view.
        
    }

 
    


}
