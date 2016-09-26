//
//  ViewController.swift
//  Timeverse
//
//  Created by Mohamed Ted Meftah on 9/26/16.
//  Copyright © 2016 Mohamed Ted Meftah. All rights reserved.
//

import UIKit
import TimeverseKit

class ViewController: UIViewController {
    @IBOutlet weak var textTime: TextTimeView!
    
    private var lastMinute:Int = -1;
    private var lastHour:Int = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTextTime), userInfo: nil, repeats: true)
    }
    
    func updateTextTime () {
        let date = Date()
        let calendar = Calendar.current
        let minute = Int(round(Float(calendar.component(.minute, from: date)) / 5.0) * 5)
        let hour = calendar.component(.hour, from: date) % 12
        
        if (lastMinute != minute || lastHour != hour) {
            lastMinute = minute
            lastHour = hour
            textTime.setTime(hour: lastHour, minute: lastMinute)
        }
    }

}
