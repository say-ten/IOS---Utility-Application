//
//  TimerViewController.swift
//  Utility Application
//
//  Created by USER on 9/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit
import AVFoundation

class TimerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let sound = Bundle.main.path(forResource: "alert", ofType: ".mp3")
        try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var second = 60
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func slide(_ sender: UISlider)
    {
        second = Int(sender.value)
        time.text = String(second) + "Seconds"
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBAction func start(_ sender: AnyObject)
    {
        timer = Timer .scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
        slider.isHidden = true
        startButton.isHidden = true
    }
    
    func counter()
    {
        second -= 1
        time.text = String(second) + "Seconds"
        if (second == 0)
        {
            timer.invalidate()
            audioPlayer.play()
        }
    }
    
    @IBOutlet weak var stopButton: UIButton!
    @IBAction func stop(_ sender: AnyObject)
    {
        timer.invalidate()
        second = 30
        slider.setValue(30, animated: true)
        time.text = "30 Seconds"
        audioPlayer.stop()
        slider.isHidden = false
        startButton.isHidden = false
    }
}
