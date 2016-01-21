//
//  ViewController.swift
//  i5iOsTp
//
//  Created by Alex on 06/01/2016.
//  Copyright © 2016 Alex.Barbez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var downloadLabel: UILabel!
    @IBOutlet weak var downloadTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(animated: Bool) {
        
        let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        print(isUserLoggedIn);
        if(!isUserLoggedIn){
            self.performSegueWithIdentifier("loginView", sender: self);
        }
        
        //Check to fill the download data
        var varDlName : String? = NSUserDefaults.standardUserDefaults().objectForKey("dlName") as? String
    print("Verif des données retrouvées en base")
    print(varDlName)
        if varDlName == nil      //Check for first run of app
        {
            varDlName = "No download..."; //Default value
        }
        downloadLabel.text = varDlName!
        //check to fill the download time
        var varDlPercent : String? = NSUserDefaults.standardUserDefaults().objectForKey("dlPercent") as? String
    print(varDlPercent)
        if varDlPercent == nil      //Check for first run of app
        {
            varDlPercent = "...%"; //Default value
        }
        downloadTime.text = varDlPercent! + " %"
        
        
    }
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        self.performSegueWithIdentifier("loginView", sender: self);
    }

}

