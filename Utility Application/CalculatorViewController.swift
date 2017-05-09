//
//  CalculatorViewController.swift
//  Utility Application
//
//  Created by USER on 9/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var calculate = false
    var displayNumber:Double = 0;
    var lastNumber:Double = 0;
    var function = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton)
    {
        if calculate == true
        {
            label.text = String(sender.tag-1)
            displayNumber = Double(label.text!)!
            calculate = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            displayNumber = Double(label.text!)!
        }
    }
    
    @IBAction func functions(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            lastNumber = Double(label.text!)!
            
            if sender.tag == 12 //division
            {
                label.text = "/";
            }
            else if sender.tag == 13 //multiplication
            {
                label.text = "*";
            }
            else if sender.tag == 14 //subtraction
            {
                label.text = "-";
            }
            else if sender.tag == 15 //addition
            {
                label.text = "+";
            }
            
            function = sender.tag
            calculate = true;
        }
        else if sender.tag == 16
        {
            if function == 12
            {
                label.text = String(lastNumber / displayNumber)
            }
            else if function == 13
            {
                label.text = String(lastNumber * displayNumber)
            }
            else if function == 14
            {
                label.text = String(lastNumber - displayNumber)
            }
            else if function == 15
            {
                label.text = String(lastNumber + displayNumber)
            }
        }
        else if sender.tag == 11
        {
            label.text = "";
            displayNumber = 0;
            lastNumber = 0;
            function = 0;
        }
    }
}
