//
//  DetailViewController.swift
//  Roster App
//
//  Created by Jeremy Moore on 6/10/15.
//  Copyright (c) 2015 Moore & Daughters. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var selectedPerson : Person!

  @IBOutlet weak var firstNameLabel: UILabel!

  @IBOutlet weak var lastNameLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      self.firstNameLabel.text = self.selectedPerson.firstName
      self.lastNameLabel.text = self.selectedPerson.lastName

        // Do any additional setup after loading the view.
    }

  
}