//
//  PersonCell.swift
//  Roster App
//
//  Created by Jeremy Moore on 7/2/15.
//  Copyright (c) 2015 Moore & Daughters. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
  
  @IBOutlet weak var shadowView: UIView!
  
  @IBOutlet weak var personImage: UIImageView!
  
  @IBOutlet weak var lastNameLabel: UILabel!
  
  @IBOutlet weak var firstNameLabel: UILabel!
  
  override func awakeFromNib() {
  super.awakeFromNib()
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
}