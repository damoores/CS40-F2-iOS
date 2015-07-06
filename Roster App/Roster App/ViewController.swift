//
//  ViewController.swift
//  Roster App
//
//  Created by homeadmin on 6/3/15.
//  Copyright (c) 2015 Moore & Daughters. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var people : [Person] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Seattle Seahawks"
    self.navigationController?.navigationBar.barTintColor = UIColor.greenColor()
    self.tableView.dataSource = self
    
    if let peopleFromArchive = self.loadFromArchive() {
      self.people = peopleFromArchive
    } else {
      self.loadPeopleFromPlist()
      self.saveToArchive()
    }
    people.sort({ $0.lastName < $1.lastName})
  }

  private func loadPeopleFromPlist () {
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
    peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String : String]]
    { for object in peopleObjects {
      if let firstName = object["FirstName"], lastName = object["LastName"] {
        let person = Person(first: firstName, last: lastName)
        people.append(person)
        }
      }
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.saveToArchive()
    self.tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    
    cell.backgroundColor = UIColor.greenColor()
    
    cell.personImage.layer.cornerRadius = 16
    cell.personImage.layer.masksToBounds = true
    cell.shadowView.backgroundColor = UIColor.clearColor()
    cell.shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
    cell.shadowView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    cell.shadowView.layer.shadowOpacity = 1
    cell.shadowView.layer.shadowRadius = 2

    let personToDisplay = people[indexPath.row]
    cell.firstNameLabel.text = personToDisplay.firstName
    cell.lastNameLabel.text = personToDisplay.lastName + ","
    if let image = personToDisplay.image {
      cell.personImage.image = image
    }
    
    let userDefaults = NSUserDefaults.standardUserDefaults()
    if let lastSelectedName = userDefaults.objectForKey("LastSelected") as? String where lastSelectedName == personToDisplay.firstName {
      cell.backgroundColor = UIColor.lightGrayColor()
    }
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      if let detailViewController = segue.destinationViewController as? DetailViewController {
        let myindexPath = tableView.indexPathForSelectedRow()
        if let indexPath = tableView.indexPathForSelectedRow() {
          let selectedRow = indexPath.row
          let  selectedPerson = people[selectedRow]
          detailViewController.selectedPerson = selectedPerson
          
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setObject(selectedPerson.firstName, forKey: "LastSelected")
        userDefaults.synchronize()
        }
      }
    }
  }
  
  func saveToArchive() {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      NSKeyedArchiver.archiveRootObject(self.people, toFile: archivePath + "/archive")
    }
  }
  
  func loadFromArchive() -> [Person]? {
    if let archivePath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last as? String {
      if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(archivePath + "/archive") as? [Person] {
        return peopleFromArchive
      }
    }
    return nil
  }
}

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  /*  

  let roster = ["Billy", "Bobby", "Barbie", "Blaine", "Ralph"]
  var rosterPointer = 0



  @IBOutlet weak var displayName: UILabel!

  @IBAction func rightButtonPressed(sender: AnyObject) {
  
    func changeLabelTextRight() {
      var labelText : String
      if (rosterPointer < (roster.count - 1)) {
        rosterPointer = rosterPointer + 1
        labelText = roster[rosterPointer]

      self.displayName.text = labelText
      }
    }
    changeLabelTextRight()
  }

  @IBAction func leftButtonPressed(sender: AnyObject) {
    
    func changeLabelTextLeft() {
      var labelText : String
      if rosterPointer > 0 {
        rosterPointer = rosterPointer - 1
        labelText = roster[rosterPointer]
        
      self.displayName.text = labelText
      }
    }
    changeLabelTextLeft()
  }
 */
  








