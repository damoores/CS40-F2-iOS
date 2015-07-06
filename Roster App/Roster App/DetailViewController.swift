//
//  DetailViewController.swift
//  Roster App
//
//  Created by Jeremy Moore on 6/10/15.
//  Copyright (c) 2015 Moore & Daughters. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var shadowView: UIView!
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var imageView: UIImageView!
  
  
  var selectedPerson : Person!

    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.setupTextFields()
    }
  
  private func setupTextFields() {
    self.firstNameTextField.delegate = self
    self.lastNameTextField.delegate = self
    self.firstNameTextField.tag = 0
    self.lastNameTextField.tag = 1
    self.firstNameTextField.text = self.selectedPerson.firstName
    self.lastNameTextField.text = self.selectedPerson.lastName
    if let image = self.selectedPerson.image {
      self.imageView.image = self.selectedPerson.image
    }
    imageView.layer.cornerRadius = 50
    imageView.layer.masksToBounds = true
    shadowView.backgroundColor = UIColor.clearColor()
    shadowView.layer.shadowColor = UIColor.darkGrayColor().CGColor
    shadowView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    shadowView.layer.shadowOpacity = 1
    shadowView.layer.shadowRadius = 2
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      self.selectedPerson.firstName = textField.text
    } else {
      self.selectedPerson.lastName = textField.text
    }
  }
  
  @IBAction func photoButton(sender: AnyObject) {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    imagePickerController.allowsEditing = true
    
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
      self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
  }
  
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    
    let image = info[UIImagePickerControllerEditedImage] as! UIImage
    self.imageView.image = image
    self.selectedPerson.image = image
    picker.dismissViewControllerAnimated(true, completion: nil)
  }
}
