//
//  StopwatchViewController.swift
//  Utility Application
//
//  Created by USER on 1/5/17.
//  Copyright © 2017 214126186. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopwatchLabel.text = "00:00.00"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //variables for stopwatch
    var laps: [String] = []
    var timer = Timer()
    var minutes: Int = 0
    var seconds: Int = 0
    var fractions: Int = 0
    var stopwatchString: String = ""
    var startStopTime: Bool = true
    var addLap: Bool = false
    
    //linked outlets
    @IBOutlet weak var stopwatchLabel: UILabel!
    @IBOutlet weak var lapTableView: UITableView!
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var lapResetButton: UIButton!
    
    //function to start and top timer on button press as well as change between the 2 buttons
    @IBAction func startStop(_ sender: AnyObject) {
        if startStopTime == true {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(StopwatchViewController.updateStopwatch), userInfo: nil, repeats: true)
            startStopTime = false
            startStopButton.setImage(UIImage(named: "Stop-1.png"), for: UIControlState.normal)
            lapResetButton.setImage(UIImage(named: "Lap.png"), for: UIControlState.normal)
            addLap = true
        }
        else {
            timer.invalidate()
            startStopTime = true
            startStopButton.setImage(UIImage(named: "Start.png"), for: .normal)
            lapResetButton.setImage(UIImage(named: "Reset.png"), for: .normal)
            addLap = false
        }
    }
    
    //function to save current stopwatch time into table view and reset timer
    @IBAction func lapReset(_ sender: AnyObject) {
        if addLap == true {
            laps.insert(stopwatchString, at: 0)
            lapTableView.reloadData()
        }
        else {
            addLap = false
            lapResetButton.setImage(UIImage(named: "Lap.png"), for: .normal)
            laps.removeAll(keepingCapacity: false)
            lapTableView.reloadData()
            fractions = 0
            seconds = 0
            minutes = 0
            stopwatchString = "00:00.00"
            stopwatchLabel.text = stopwatchString
        }
    }
    
    //function to update stopwatch counting time
    func updateStopwatch() {
        fractions += 1
        if fractions == 100 {
            seconds += 1
            fractions = 0
        }
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
        let secondsString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
        let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
        
        stopwatchString = "\(minutesString):\(secondsString).\(fractionsString)"
        stopwatchLabel.text = stopwatchString
    }
    
    //function to display lap time into tables
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
        cell.backgroundColor = self.view.backgroundColor
        cell.textLabel?.text = "Lap \(laps.count-indexPath.row)"
        cell.detailTextLabel?.text = laps[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
}
