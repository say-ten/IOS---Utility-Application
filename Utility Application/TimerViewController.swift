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
        do
        {
            let sound = Bundle.main.path(forResource: "alert", ofType: ".wav")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch
        {
            print ("error")
        }
        stopButton.isHidden = true
        slider.setValue(60, animated: true)
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
        time.text = String(second)
    }
    
    @IBOutlet weak var startButton: UIButton!
    @IBAction func start(_ sender: AnyObject)
    {
        timer = Timer .scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerViewController.counter), userInfo: nil, repeats: true)
        slider.isEnabled = false
        startButton.isHidden = true
        stopButton.isHidden = false
    }
    
    func counter()
    {
        second -= 1
        time.text = String(second)
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
        second = 60
        slider.setValue(60, animated: true)
        time.text = "60"
        audioPlayer.stop()
        slider.isEnabled = true
        startButton.isHidden = false
        stopButton.isHidden = true
    }
}
