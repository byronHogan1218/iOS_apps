//
//  Book.swift
//  RushPicker_iOS11
//
//  Created by Kai Rush on 3/21/18.
//  Copyright © 2018 Kai Rush. All rights reserved.
//

import UIKit

class Book: NSObject {
    // Properties for the Book object
    var title: String!
    var author:String!
    var isbn:String!
    var bookImage:String!
    var publisher:String!
    var pubYear:String!
    
    // Initializer
    init(title: String, author: String, isbn: String,
         bookImage: String, publisher: String, pubYear: String) {
        self.title = title
        self.author = author
        self.isbn = isbn
        self.bookImage = bookImage
        self.publisher = publisher
        self.pubYear = pubYear
    }
}
