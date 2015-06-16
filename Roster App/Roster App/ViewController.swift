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
  
  var people = [Person]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.dataSource = self
    // Do any additional setup after loading the view, typically from a nib.
  
    let russell = Person(first: "Russell", last: "Wilson")
    let sherman = Person(first: "Richard", last: "Sherman")
    let steve = Person(first: "Steve", last: "Largent")
    let lynch = Person(first: "Marshawn", last: "Lynch")
    let pete = Person(first: "Pete", last: "Carroll")
    
    self.people.append(russell)
    self.people.append(sherman)
    self.people.append(steve)
    self.people.append(lynch)
    self.people.append(pete)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
 
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let personToDisplay = self.people[indexPath.row]
    cell.textLabel?.text = personToDisplay.firstName + " " + personToDisplay.lastName
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
  
      let detailViewController = segue.destinationViewController as! DetailViewController
      let indexPath = self.tableView.indexPathForSelectedRow()
      let selectedRow = indexPath!.row
      let selectedPerson = self.people[selectedRow]
      
      detailViewController.selectedPerson = selectedPerson
      
    }
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
  








