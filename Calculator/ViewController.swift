//
//  ViewController.swift
//  Calculator
//
//  Created by Shaojie Cai on 4/3/17.
//  Copyright © 2017 IOT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false
    var operation = 0;

    @IBOutlet var label: UILabel!
    @IBAction func numbers(_ sender: UIButton) {
        
        if performingMath == true
        {
            label.text = String(sender.tag-1)
            numOnScreen = Double(label.text!)!
            performingMath = false
        
        }
        else
        {
            label.text = label.text! +  String(sender.tag-1)
            numOnScreen = Double(label.text!)!

        }
        
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 // Devide
            {
                label.text = "/";
            }
            else if sender.tag == 13 // Multiply
            {
                label.text = "x";
            
            }
            else if sender.tag == 14 // Minus
            {
                label.text = "-";
                
            }
            else if sender.tag == 15 // Plus
            {
                label.text = "+";
                
            }
            
            operation = sender.tag
            performingMath = true;
        
        }
        
        else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numOnScreen)
            }
            
            else if operation == 13
            {
                label.text = String(previousNumber * numOnScreen)
                
            }
            else if operation == 14
            {
                label.text = String(previousNumber - numOnScreen)
                
            }
            else if operation == 15
            {
                label.text = String(previousNumber + numOnScreen)
            }
        }
        
        else if sender.tag == 11
        {
            label.text = ""
            previousNumber = 0;
            numOnScreen = 0;
            operation = 0;
            
            
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

