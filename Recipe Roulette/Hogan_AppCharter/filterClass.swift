//
//  filterClass.swift
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
 
 
 Purpose:     Creates a a way to hold data in between View controllers
 
 
 ***************************************************************************************************/
import Foundation
import UIKit
class FilterArray {
    static var sharedInstance = FilterArray() // This is singleton,similar to a global varaible
    var filterArray = [Bool]()
    var hasChanged:Bool
    var countReduced:Bool
    private init() {//Initializes the global variables
        hasChanged = false
        countReduced = false
        var i = 0
        while i < 13{//13 is the amount of search preferences that this app has
            filterArray.append(false)
            i += 1
        }
    }
}
