//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var story: UILabel!
    @IBOutlet weak var choice1Btn: UIButton!
    @IBOutlet weak var choice2Btn: UIButton!
    
    let story0 = "You see a fork in the road."
    let choice1 = "Take a left."
    let choice2 = "Take a right."

    override func viewDidLoad() {
        super.viewDidLoad()
        story.text = story0
        choice1Btn.titleLabel?.text = choice1
        choice2Btn.titleLabel?.text = choice2
    }


}

