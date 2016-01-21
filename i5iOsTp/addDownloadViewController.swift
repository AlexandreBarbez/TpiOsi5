//
//  addDownloadViewController.swift
//  i5iOsTp
//
//  Created by Alex on 18/01/2016.
//  Copyright © 2016 Alex.Barbez. All rights reserved.
//

import UIKit

class addDownloadViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var downloadName: UITextField!
    
    var pickerDataSource : Array<String> = [];
    var timeRemaining = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self;
        self.pickerView.delegate = self;
        for (var index = 0; index <= 100; ++index){
            pickerDataSource.append(String(index));
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        timeRemaining = row;
    }
    @IBAction func AddDownload(sender: AnyObject) {
       //recup les valeurs
        let dlName = downloadName.text;
        let dlPercent = timeRemaining;
        
        //verif les valeurs
        if(dlName == "" || dlPercent==0){
            displayAlertMessage("Please Fill the download informations");
            return;
        }
        else{
            //Store data
            NSUserDefaults.standardUserDefaults().setObject(dlName, forKey: "dlName");
            NSUserDefaults.standardUserDefaults().setObject(String(dlPercent), forKey: "dlPercent");
            NSUserDefaults.standardUserDefaults().synchronize();
            //verif des valeurs saisies
            print("Verif des valeurs saisies lors de l'ajout d'un download");
            print(NSUserDefaults.standardUserDefaults().objectForKey("dlName"));
            print(NSUserDefaults.standardUserDefaults().objectForKey("dlPercent"));
        }
    }
    
    func displayAlertMessage(userMessage:String){
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated: true, completion:nil);
    }
    @IBAction func CancelButtonTapped(sender: AnyObject) {
                    self.performSegueWithIdentifier("printDownload", sender: self);
    }
    

}
