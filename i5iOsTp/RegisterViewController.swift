//
//  RegisterViewController.swift
//  i5iOsTp
//
//  Created by Alex on 07/01/2016.
//  Copyright © 2016 Alex.Barbez. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userRetypePasswordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func registerButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userRetypePassword = userRetypePasswordTextField.text;
        
        
        //check if fields are empty
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRetypePassword!.isEmpty)
        {
            displayAlertMessage("All fields are required");
            return;
        }
        //check if password match
        if(userPassword != userRetypePassword){
            displayAlertMessage("Passwords didn't match");
            return;
        }
        
        //Store data
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail");
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        //Display confirmation
            //Message displayed + pop-up
        let registrationConfirmationAlert = UIAlertController(title: "Alert", message: "Registration successfull !", preferredStyle: UIAlertControllerStyle.Alert);
            //Ok button
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default){
            action in
            self.dismissViewControllerAnimated(true, completion: nil);
        }
        
        registrationConfirmationAlert.addAction(okAction);
        self.presentViewController(registrationConfirmationAlert, animated: true, completion:nil);
    }
    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);

        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion:nil);
    }

}
