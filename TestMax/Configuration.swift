//
//  Configuration.swift
//  TestMax
//
//  Created by Arpan Badeka on 2/28/16.
//  Copyright © 2016 abc. All rights reserved.
//
import UIKit

let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
let documentsDirectory = paths[0] as! NSString
let path = documentsDirectory.stringByAppendingPathComponent("MultipleChoice.plist")

let pathMC = NSBundle.mainBundle().pathForResource("MultipleChoice", ofType: "plist")

var multipleArray: Array<[String:AnyObject]>?

var bgImage: String?
