//
//  Person.swift
//  Roster App
//
//  Created by Jeremy Moore on 6/10/15.
//  Copyright (c) 2015 Moore & Daughters. All rights reserved.
//

import UIKit

  class Person : NSObject, NSCoding {
  
  var firstName : String
  var lastName : String
  var image : UIImage?
  
  init (first : String, last : String) {
    firstName = first
    lastName = last
  }
  
  required init(coder aDecoder: NSCoder) {
    firstName = aDecoder.decodeObjectForKey("firstName") as! String
    lastName = aDecoder.decodeObjectForKey("lastName") as! String
    image = aDecoder.decodeObjectForKey("image") as? UIImage
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(firstName, forKey: "firstName")
    aCoder.encodeObject(lastName, forKey: "lastName")
    aCoder.encodeObject(image, forKey: "image")
  }
}
