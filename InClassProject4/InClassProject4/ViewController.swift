//
//  ViewController.swift
//  InClassProject4
//
//  Created by Joshua Goodman on 2/17/20.
//  Copyright © 2020 Joshua Goodman. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {

    @IBOutlet weak var usernamerFIeld: UITextField!
    
    
    @IBAction func displayAlert(_ sender: Any) {
        //Setup the ALert
        let alert = UIAlertController(title: "Important Update", message: "Mr. Goodman is the greatest.", preferredStyle: .alert)
        
        // Add the action
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in }))
        
        //Display Alert
        self.present(alert,animated: true, completion: nil)
        
        
    }
    
    //Design the Second Alert
    @IBAction func loginAlert(_ sender: Any) {
        
        //Design the input collection
        let ac = UIAlertController(title: ("What is your Username?"), message: nil, preferredStyle: .alert)
        ac.addTextField()
        _ = UIAlertAction(title: "Sumbit", style: .default) { [unowned ac] _ in}
        let answer = ac.textFields![0]
        self.usernamerFIeld.text = answer.text
        
        
        //Design second Alert
        let alert = UIAlertController(title: "Welcome:", message: answer.text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: {_ in}))
        
        //Display the Alert
        self.present(alert,animated: true, completion: nil)
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    @IBAction func playMedia(_ sender: Any) {
        
        //Play wav file
        var soundID: SystemSoundID = 0
        let soundFile:String=Bundle.main.path(forResource:"r2-d2", ofType: "wav")!
        let soundURL: NSURL = NSURL(fileURLWithPath: soundFile)
        AudioServicesCreateSystemSoundID(soundURL, &soundID)
        AudioServicesPlaySystemSound(soundID)

        //Vibrate phone
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

            //Vibrate phone
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
           
    }


}

