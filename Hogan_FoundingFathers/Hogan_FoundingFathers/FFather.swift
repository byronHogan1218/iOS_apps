//
//  President.swift
//  Hogan_FoundingFathers
//
//  Created by Byron Hogan on 2/15/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    02/22/18
 Assignment:  App 3
 
 
 Purpose:     To define a FFather class to hold Founding father Objects
 
 ***************************************************************************************************/


import Foundation
import UIKit

//Define object properties for the Founding father class
class FFather: NSObject {
    var number: String!
    var name:String!
    var title:String!
    var year:String!
    var spouse:String!
    var party:String!
    var cellImage:String!
    var ffatherImage:String!
    
    //Initialization method used to assign each part of the object to the passed in values
    init ( number: String!,name:String!, title: String!, year: String!, spouse: String!, party: String!, cellImage: String!, ffatherImage:String!){
        self.number = number
        self.name = name
        self.title = title
        self.year = year
        self.spouse = spouse
        self.party = party
        self.cellImage = cellImage
        self.ffatherImage = ffatherImage
    }
    
}
