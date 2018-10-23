//
//  recipe.swift
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
 
 
 Purpose:     Creates a recipe class and defines the parts of it
 
 
 ***************************************************************************************************/
import Foundation
import UIKit

class Recipe: NSObject, Decodable{
    
    let title:String!
    let rating:Int!
    let sourceName:String!
    let imageURL:String!
    let readyInMinutes:Int!
    let servings:Int!
    let websiteURL:String!

    
    //Initialize data
    init(title: String!, rating: Int!, sourceName:String!, imageURL:String!, readyInMinutes:Int!, servings:Int!, websiteURL:String!){
        self.title = title
        self.rating = rating
        self.sourceName = sourceName
        self.imageURL = imageURL
        self.readyInMinutes = readyInMinutes
        self.servings = servings
        self.websiteURL = websiteURL

        
    }
    
    
}

