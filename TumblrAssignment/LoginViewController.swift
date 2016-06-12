//
//  LoginViewController.swift
//  TumblrAssignment
//
//  Created by Scott Horsfall on 6/11/16.
//  Copyright © 2016 Scott Horsfall. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        emailField.becomeFirstResponder()
        
        /*
         
         optionals if need to animate the login fields
         
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil)
        */
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancelTap(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        view.endEditing(true)
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        //
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        //
    }

    
}
