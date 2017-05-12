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
    
    var list = ["Your input gets put in here"]
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var listTableView: UITableView!
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            list.remove(at: indexPath.row)
            listTableView.reloadData()
        }
    }
    

}
