//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft" : 5, "Medium" : 8, "Hard" : 12]
    var timeNeed:Int = 0
    var timer = Timer()
    var secondPassed:Int = 0
    override func viewDidLoad() {
        progressBar.progress = 0
    }
    
    @IBAction func mediumPressed(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0
        secondPassed = 0
        let hardness = sender.titleLabel?.text
         timeNeed = eggTimes[hardness!]!*1
        
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(fire(timer:)), userInfo: nil, repeats: true)
    }
    @objc func fire(timer: Timer)
    {
        if secondPassed < timeNeed {
            let percentage = Float(secondPassed)/Float(timeNeed)
            progressBar.progress = percentage
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            statusLabel.text = "Done"
            playSound()

        }
        secondPassed += 1
            }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }

}
