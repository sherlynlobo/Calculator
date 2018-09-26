//
//  ViewController.swift
//  Calculator
//
//  Created by Sherlyn Lobo on 2018-09-25.
//  Copyright © 2018 Sherlyn Lobo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var numberDispalayed:Double=0;
    var enteredNumber:Double=0;
    var mathOperations = false
    var operation = 0;
    var hasDecimal:Bool = false

    
    
    @IBOutlet var ResultsLabel: UILabel!
    @IBAction func decimalPoint(_ sender: UIButton) {
        //starts here
        /*
        if(ResultsLabel.text == "0") {
            
            if(sender.tag != -1) {
                ResultsLabel.text = ""
                
            }
            else {
                if(hasDecimal) {
                    ResultsLabel.text = "0"
                }
            }
            
        }
        
        */
        
        if(sender.tag == 19) {
            if(!hasDecimal) {
                ResultsLabel.text?.append(".")
                hasDecimal = true
            }
        }
        else {
            ResultsLabel.text?.append(String(sender.tag-1))
        }
        
        
        //ends here
        
        
    }
    @IBAction func CalcNumbers(_ sender: UIButton)
    {
        
        if mathOperations == true
        {
            ResultsLabel.text = String(sender.tag-1)
            numberDispalayed = Double(ResultsLabel.text!)!
            mathOperations = false;
        }
        else
        {
            ResultsLabel.text=ResultsLabel.text! + String(sender.tag-1)
            numberDispalayed=Double (ResultsLabel.text!)!
            
        }
    
        
    }
    

    @IBAction func CalcButtons(_ sender: UIButton)
    {
        if ResultsLabel.text != "" && sender.tag != 18 && sender.tag != 11 && mathOperations == false
        {
            enteredNumber=Double(ResultsLabel.text!)!
            if sender.tag == 15 //divide
            {
                ResultsLabel.text = "/";

            }
            else if sender.tag == 14 //multiply
            {
                ResultsLabel.text = "*";

            }
            else if sender.tag == 13  //subtract
            {
                ResultsLabel.text = "-";

            }
            else if sender.tag == 12  //add
            {
                ResultsLabel.text = "+";

            }
            else if sender.tag == 16 //percentage
            {
                ResultsLabel.text = "%";

            }
            operation = sender.tag
            mathOperations = true;
            
        }
        else if sender.tag == 11
        {
            if operation == 15
            {
                ResultsLabel.text = String(enteredNumber / numberDispalayed)
            }
        
            else if operation == 14
        {
            
            ResultsLabel.text = String(enteredNumber * numberDispalayed)
        }
        
           else if operation == 13
        {
            
            ResultsLabel.text = String(enteredNumber - numberDispalayed)
        }
        
            else if operation == 12
        {
            
            ResultsLabel.text = String(enteredNumber + numberDispalayed)
        }
        
            else if operation == 16
        {
           // ResultsLabel.text = String(enteredNumber % numberDispalayed)
        }

        }
        else if sender.tag == 19
        {
            //starts here
           
            
            //ends here
            
            
            
    
            
        }
        else if sender.tag == 18
        {
            ResultsLabel.text = "";
            numberDispalayed = 0;
            enteredNumber = 0;
            operation = 0;
            hasDecimal = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

