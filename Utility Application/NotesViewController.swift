//
//  NotesViewController.swift
//  Utility Application
//
//  Created by USER on 9/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //variables for notes
    var list = ["Your input gets put in here", "Swipe left to delete"]
    
    //linked outlets
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var listTableView: UITableView!
    
    //function to add what is written in textinput to table
    @IBAction func AddButton(_ sender: Any)
    {
        if (textInput.text != "")
        {
            list.append(textInput.text!)
            textInput.text = ""
            listTableView.reloadData()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (list.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        return(cell)
    }
    
    //implements the swipe to delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            list.remove(at: indexPath.row)
            listTableView.reloadData()
        }
    }
    

}
