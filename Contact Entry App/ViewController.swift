//
//  ViewController.swift
//  Contact Entry App
//
//  Created by Michael Liu on 2018-10-17.
//  Copyright © 2018 CS2680. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstnameField: UITextField!
    
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var companyField: UITextField!
    

    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.viewTapped))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @IBAction func textFieldDoneEditing(_ sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @objc func viewTapped()
    {
        firstnameField.resignFirstResponder()
        lastnameField.resignFirstResponder()
        companyField.resignFirstResponder()
        emailField.resignFirstResponder()
        phoneField.resignFirstResponder()
    }
    

    @IBAction func cancelButton(_ sender: Any) {
    
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Are you sure?", message: "Option to select", preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "No way!", style: .cancel)
        { _ in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let yesActionButton = UIAlertAction(title: "Yes, I'm sure!", style: .default)
        { _ in
            print("Yes, I'm sure!")
            self.firstnameField.text = ""
            self.lastnameField.text = ""
            self.companyField.text = ""
            self.phoneField.text = ""
            self.emailField.text = ""
        }

        actionSheetControllerIOS8.addAction(yesActionButton)
        

        self.present(actionSheetControllerIOS8, animated: true, completion: nil)
    
    }
    

    @IBAction func saveButton(_ sender: Any) {
        
        
        if  (firstnameField.text != "" &&
            lastnameField.text != "" &&
            companyField.text != "" &&
            phoneField.text != "" &&
            emailField.text != "")
            
        {
            //do something if it's not empty

        
            // create the alert
            let alert = UIAlertController(title: "Contact Saved", message: "\(firstnameField.text!) now is a contact!", preferredStyle: UIAlertController.Style.alert)


            // add an action (button)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))

            // show the alert
            self.present(alert, animated: true, completion: nil)
          
                self.firstnameField.text = "";
                self.lastnameField.text = "";
                self.companyField.text = "";
                self.phoneField.text = "";
                self.emailField.text = "";
       
            
        }
        else {
            let alert = UIAlertController(title: "Error", message: "Please input value!\n Fields can't be empty!", preferredStyle: UIAlertController.Style.alert)
            
            // add an action (button)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            
            // show the alert
            self.present(alert, animated: true, completion: nil)        }
    }
}

