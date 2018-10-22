//  ViewController.swift
//  Calculator
//  Created by Sherlyn Lobo on 2018-09-25.
//  Copyright © 2018 Sherlyn Lobo. All rights reserved.

//  File Name       : ViewController.swift
//  Author Name     : Sherlyn Lobo
//  Student ID      : 301013071
//  Date            : 26-09-2018 (DD/MM/YYYY)
//  App Description : Simple Calculator
//  Version 1.4

import UIKit
//View Controller class
class ViewController: UIViewController {
    var numberDispalayed:Double=0;
    var enteredNumber:Double=0;
    var mathOperations = false
    var operation = 0;
    var hasDecimal:Bool = false
    

    
    @IBOutlet var ResultsLabel: UILabel!
    
    
    @IBOutlet var TextFields: [UIButton]!
    
    @IBAction func changeText(_ sender: UIBarButtonItem) {   //change button text
        
        let alertController1 =  UIAlertController(title: "Choose your style", message:"", preferredStyle: .alert)
        let alertAction3 = UIAlertAction(title: "Black", style: .default) { (alert) in
            
            UIView.animate(withDuration: 1, animations: {
                
                // textChange
                for aTextField in self.TextFields{
                    aTextField.setTitleColor(UIColor.black, for: .normal)
                }
            }, completion: nil)
        }
        
        let alertAction4 = UIAlertAction(title: "Gray", style: .default) { (alert) in
            UIView.animate(withDuration: 1, animations: {
                // textChange
                for aTextField in self.TextFields{
                    aTextField.setTitleColor(UIColor.lightGray, for: .normal)
                }
            }, completion: nil)
        }
        
        alertController1.addAction(alertAction3)
        alertController1.addAction(alertAction4)
        // function
        present(alertController1, animated: true, completion: nil)

        
    }
    
    @IBAction func changeBackground(_ sender: UIBarButtonItem) { //Change background color
        
        let alertController =  UIAlertController(title: "Choose your style", message:"", preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: "Light", style: .default) { (alert) in
            
            UIView.animate(withDuration: 1, animations: {
                //self.turnLight.backgroundColor = UIColor.gray
                self.view.backgroundColor = UIColor.init(red: 255, green: 255, blue: 0, alpha: 90)
                // background for buttons
                
                
            }, completion: nil)
        }
        
        let alertAction2 = UIAlertAction(title: "Dark", style: .default) { (alert) in
            UIView.animate(withDuration: 1, animations: {
                // change background for top numbers
                
                
                self.view.backgroundColor = UIColor.gray
            }, completion: nil)
        }
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction2)
        // function
        present(alertController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func CancelButton(_ sender: UIButton) { //For Backspace (Cancel Button)
        if sender.tag == 17
        {
            if (ResultsLabel.text!).count > 0
            {
                let characters = Array(ResultsLabel.text!)
                
                ResultsLabel.text = String((characters.dropLast()))
                if ResultsLabel.text!.isEmpty
                {
                    mathOperations = false
                }
            }
            
        }
        
        
        
        
    }
    @IBAction func decimalPoint(_ sender: UIButton) { // For Decimal Point

        
        if(sender.tag == 19)
        {
            if(!hasDecimal)
            {
                ResultsLabel.text?.append(".")
                hasDecimal = true
            }
        }
        else {
            ResultsLabel.text?.append(String(sender.tag-1)) 
            }
        
    
        
    }
    @IBAction func CalcNumbers(_ sender: UIButton) // Numeric Values
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
    

    @IBAction func CalcButtons(_ sender: UIButton) // Operations
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
            hasDecimal = false
            
        }
        else if sender.tag == 11
        {
            if operation == 15    // For Division
            {
                ResultsLabel.text = String(enteredNumber / numberDispalayed)
            }
        
            else if operation == 14   // For Multiplication
        {
            
            ResultsLabel.text = String(enteredNumber * numberDispalayed)
        }
        
           else if operation == 13 // For Subtraction
        {
            
            ResultsLabel.text = String(enteredNumber - numberDispalayed)
        }
        
            else if operation == 12 // For Addition
        {
            
            ResultsLabel.text = String(enteredNumber + numberDispalayed)
        }
        
            else if operation == 16   //For Percentage
            {
                enteredNumber = enteredNumber/100.0
                ResultsLabel.text = String(enteredNumber)
                hasDecimal = false
            }
            mathOperations = true;
            hasDecimal = false

        }

        else if sender.tag == 18   // For AC Button (Reset)
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

