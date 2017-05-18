//
//  TableViewController.swift
//  Utility Application
//
//  Created by USER on 10/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var library = MusicLibrary().library
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //tableview for artist, title and cover image data
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return library.count
    }
    
    //override tableview with cell data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song") as! SongTableViewCell
        cell.artistLabel.text = library[indexPath.row]["artist"]
        cell.titleLabel.text = library[indexPath.row]["title"]
        if let coverImage = library[indexPath.row]["coverImage"] {
            cell.coverImagePicture.image = UIImage(named: "\(coverImage).jpg")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Player", sender: self)
    }
    
    //custom push segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Player" {
            let playerVC = segue.destination as! MediaPlayerViewController
            let indexPath = tableView.indexPathForSelectedRow!
            playerVC.trackId = indexPath.row
        }
    }
}

