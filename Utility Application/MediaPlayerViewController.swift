//
//  MediaPlayerViewController.swift
//  Utility Application
//
//  Created by USER on 1/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

//input song details to show in application
struct MusicLibrary {
    var library = [
        ["title":"Open Sesame","artist":"Ross Gregor","index":"0","coverImage":"0"],
        ["title":"Song Acid","artist":"DJ Sona","index":"1","coverImage":"1"],
        ["title":"Chords of Heaven","artist":"John Smith","index":"2","coverImage":"2"],]
}

class MediaPlayerViewController: UIViewController {
    
    //variables for elements in mediaplayer
    @IBOutlet weak var coverImagePicture: UIImageView!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var shuffleSwitch: UISwitch!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var trackId: Int = 0
    var library = MusicLibrary().library
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let coverImage = library[trackId]["coverImage"]{
            coverImagePicture.image = UIImage(named: "\(coverImage).jpg")
            playButton.isHidden = true;
        }
        
        //setting labels with library data
        titleLabel.text = library[trackId]["title"]
        artistLabel.text = library[trackId]["artist"]
        //getting song file and playing
        let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
        if let path = path
        {
            let mp3URL = URL(fileURLWithPath: path)
            do
            {
                audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                audioPlayer.play()
                
                Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MediaPlayerViewController.updateProgressBar), userInfo: nil, repeats: true)
                progressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
            }
            catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        audioPlayer.stop()
    }
    
    func updateProgressBar()
    {
        if audioPlayer.isPlaying
        {
            progressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: true)
            playButton.isHidden = true;
            pauseButton.isHidden = false;
        }
        else
        {
            playButton.isHidden = false;
            pauseButton.isHidden = true;
        }
    }
    
    @IBAction func playAction(_ sender: AnyObject)
    {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
        }
    }
    
    @IBAction func stopAction(_ sender: AnyObject)
    {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        progressBar.progress = 0
    }
    
    
    @IBAction func pauseAction(_ sender: AnyObject)
    {
        audioPlayer.pause()
        
    }
    
    @IBAction func fastForwardAction(_ sender: AnyObject) {
        var time: TimeInterval = audioPlayer.currentTime
        time += 5.0
        if time > audioPlayer.duration
        {
            stopAction(self)
        }
        else
        {
            audioPlayer.currentTime = time
        }
    }
    
    @IBAction func rewindAction(_ sender: AnyObject) {
        var time: TimeInterval = audioPlayer.currentTime
        time -= 5.0
        if time < 0
        {
            stopAction(self)
        }
        else
        {
            audioPlayer.currentTime = time
        }
    }
        
    @IBAction func previousAction(_ sender: AnyObject)
    {
        if trackId != 0 || trackId > 0
        {
            if shuffleSwitch.isOn
            {
                trackId = Int(arc4random_uniform(UInt32(library.count)))
            }
            else
            {
                trackId -= 1
            }
            if let coverImage = library[trackId]["coverImage"]{
                coverImagePicture.image = UIImage(named: "\(coverImage).jpg")
            }
            
            titleLabel.text = library[trackId]["title"]
            artistLabel.text = library[trackId]["artist"]
            audioPlayer.currentTime = 0
            progressBar.progress = 0
            
            let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
            if let path = path
            {
                let mp3URL = URL(fileURLWithPath: path)
                do
                {
                    audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MediaPlayerViewController.updateProgressBar), userInfo: nil, repeats: true)
                    progressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                }
                catch let error as NSError
                {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    @IBAction func nextAction(_ sender: AnyObject)
    {
        if trackId == 0 || trackId < 4
        {
            if shuffleSwitch.isOn
            {
                trackId = Int(arc4random_uniform(UInt32(library.count)))
            }
            else
            {
                trackId += 1
            }
            
            if let coverImage = library[trackId]["coverImage"]{
                coverImagePicture.image = UIImage(named: "\(coverImage).jpg")
            }
            
            titleLabel.text = library[trackId]["title"]
            artistLabel.text = library[trackId]["artist"]
            
            audioPlayer.currentTime = 0
            progressBar.progress = 0
            
            let path = Bundle.main.path(forResource: "\(trackId)", ofType: "mp3")
            
            if let path = path
            {
                let mp3URL = URL(fileURLWithPath: path)
                do
                {
                    audioPlayer = try AVAudioPlayer(contentsOf: mp3URL)
                    audioPlayer.play()
                    
                    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(MediaPlayerViewController.updateProgressBar), userInfo: nil, repeats: true)
                    progressBar.setProgress(Float(audioPlayer.currentTime/audioPlayer.duration), animated: false)
                }
                catch let error as NSError
                {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
