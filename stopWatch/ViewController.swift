//
//  ViewController.swift
//  stopWatch
//
//  Created by VMassarelli on 3/9/16.
//  Copyright © 2016 VMassarelli. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var startStopButton: UIButton!
    @IBOutlet weak var timerlabel: UILabel!
   
    var counter = 0
    var min = 0
    var hour = 0
    var timer = NSTimer()
    var pressed = false

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    @IBAction func startStopTapped(sender: AnyObject)
    {
       if pressed == false
       {
            startStopButton.setTitle("Stop", forState: UIControlState.Normal)
            startStopButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
            timer.invalidate()
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "timerAction", userInfo: nil, repeats: true)
            pressed = true
            
        }
        else
       {
            timer.invalidate()
            pressed = false
            startStopButton.setTitle("Start", forState: UIControlState.Normal)
            startStopButton.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        }
    }

    
    @IBAction func resetTapped(sender: AnyObject)
    {
        timer.invalidate()
        counter = 0
        min = 0
        hour = 0
        timerlabel.text = "00:00.00"
        pressed = false
    }
    
    func timerAction()
    {
        counter++
        rollover()
        time()
    }
    
    func rollover()
    {
        if counter > 59
        {
            counter = 0
            min++
        }
        if min > 59
        {
            counter = 0
            min = 0
            hour++
        }
    }
    
    func time()
    {
        if hour < 10 && min < 10 && counter < 10
        {
            timerlabel.text = "0\(hour):0\(min).0\(counter)"
        }
        if hour < 10 && min < 10 && counter >= 10
        {
            timerlabel.text = "0\(hour):0\(min).\(counter)"
        }
        if hour < 10 && min >= 10 && counter < 10
        {
            timerlabel.text = "0\(hour):\(min).0\(counter)"
        }
        if hour >= 10 && min < 10 && counter < 10
        {
            timerlabel.text = "\(hour):0\(min).0\(counter)"
        }
        if hour < 10 && min >= 10 && counter >= 10
        {
            timerlabel.text = "0\(hour):\(min).\(counter)"
        }
        if hour >= 10 && min < 10 && counter >= 10
        {
            timerlabel.text = "\(hour):0\(min).\(counter)"
        }
        if hour >= 10 && min >= 10 && counter < 10
        {
            timerlabel.text = "\(hour):\(min).0\(counter)"
        }
    }
    
}

