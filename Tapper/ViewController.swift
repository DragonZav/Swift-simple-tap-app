//
//  ViewController.swift
//  Tapper
//
//  Created by Chris Augg on 11/25/15.
//  Copyright © 2015 Auggie Doggie iOSware. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // Properties
    var maxTaps = 0
    var currentTaps = 0
    
    
    // Outlets
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var howManyTapsTxt: UITextField!
    @IBOutlet weak var playBtn: UIButton!
    
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var tapsLbl: UILabel!

    
    // Viewcontroller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       self.howManyTapsTxt.delegate = self;
       
        
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
       
    
    // Actions
    
    @IBAction func onCoinTapped(sender: UIButton!) {
        currentTaps++
        updateTapsLbl()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
       
        
        
        
        
        if howManyTapsTxt.text != nil && howManyTapsTxt.text != "" {
            logoImg.hidden = true
            howManyTapsTxt.hidden = true
            playBtn.hidden = true
            
            tapBtn.hidden = false
            tapsLbl.hidden = false
            
            
            if let possibleInt = Int(howManyTapsTxt.text!) {
                
                maxTaps = possibleInt
                currentTaps = 0
                updateTapsLbl()
            } else {
                let alertController = UIAlertController(title: "Validation Error", message: "You must enter an integer number!", preferredStyle: .Alert)
                let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Destructive, handler: {(alert : UIAlertAction!) in
                    alertController.dismissViewControllerAnimated(true, completion: nil)
                })
                alertController.addAction(alertAction)
                presentViewController(alertController, animated: true, completion: nil)
                
                restartGame()
            }
            
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsTxt.text = ""
        
        logoImg.hidden = false
        howManyTapsTxt.hidden = false
        playBtn.hidden = false
        
        tapBtn.hidden = true
        tapsLbl.hidden = true
        
    }
    
    func isGameOver() -> Bool {
        return currentTaps >= maxTaps
    }
    
    func updateTapsLbl() {
        tapsLbl.text = "\(currentTaps) Taps"
    }
    
}

