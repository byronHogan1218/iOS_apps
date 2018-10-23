//
//  Student.swift
//  BHogan_StudentDir
//
//  Created by Byron Hogan on 3/27/18.
//  Copyright © 2018 Byron Hogan. All rights reserved.
//
/*************************************************************************************************
 Programmer:  Byron Hogan
 Zid:         z1825194
 Due Date:    03/30/18
 Assignment:  App 6
 
 
 Purpose:     Creates a student class and defines the parts of it
 
 
 ***************************************************************************************************/
import Foundation
import UIKit

class Student: NSObject, Decodable{

let id:Int!
let firstName:String!
let lastName:String!
let title:String!
let phone:String!
let email:String!
let course:String!
let term:String!
let year:Int!
let imageURL:String!
    
    //Initialize data
    init(id: Int!, firstName: String!, lastName:String!, title:String!, phone:String!, email:String!, course:String!, term:String!, year:Int!, imageURL:String!){
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.title = title
        self.phone = phone
        self.email = email
        self.course = course
        self.term = term
        self.year = year
        self.imageURL = imageURL
        
    }
    
    
}
