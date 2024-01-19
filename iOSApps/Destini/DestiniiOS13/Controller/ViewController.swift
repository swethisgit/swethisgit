//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    var qno = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func choiceButtonPressed(_ sender: UIButton) {
        if sender.currentTitle == storyBrain.storiesSet[qno].choice1 {
            qno = storyBrain.getQuestionNo(chosenDesti: storyBrain.storiesSet[qno].choice1Destinstion)
        } else {
            qno = storyBrain.getQuestionNo(chosenDesti: storyBrain.storiesSet[qno].choice2Destinstion)
        }
        updateUI()

    }
    
    func updateUI () {
        storyLabel.text = storyBrain.storiesSet[qno].title
        print (storyBrain.storiesSet[qno].choice1)
        choice1Button.setTitle(storyBrain.storiesSet[qno].choice1, for: .normal)
        choice2Button.setTitle(storyBrain.storiesSet[qno].choice2, for: .normal)
    }
}

