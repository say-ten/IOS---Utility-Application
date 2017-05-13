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
    
    //variables for calculator
    var calculate = false
    var displayNumber:Double = 0;
    var lastNumber:Double = 0;
    var function = 0;
    
    //linked outlet items
    @IBOutlet weak var label: UILabel!
    
    //function to tell which number was pressed then send to label
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
    
    //checks current numbers in label then sends the calculation funtions
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
        //equal button - calculates the numbers with the previously pressed function
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
        //AC button - clears view as well as previous numbers
        else if sender.tag == 11
        {
            label.text = "";
            displayNumber = 0;
            lastNumber = 0;
            function = 0;
        }
    }
}
