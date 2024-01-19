//
//  SettingsButton.swift
//  Player
//
//  Created by Sweda Thiyagarajan on 29/06/2023.
//

import Foundation
import AVKit

class SettingsButton: UIView {
    var kvoRateContext = 0
    var avPlayer: AVPlayer?
    var parentController : UIViewController?
    var settingsPopOver : SettingsPopOver?
    var isSettingsOpen: Bool = false
    
    @IBOutlet var settingsBtn: UIButton?
    @IBOutlet var settingsImg: UIImageView?
        
    func addObservers() {
        avPlayer?.addObserver(self, forKeyPath: "rate", options: .new, context: &kvoRateContext)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateSettingsUI()
    }

   @IBAction func settingTapped(_ sender: UITapGestureRecognizer) {
       updateSettingsUI()
    }
    
    func updateSettingsUI() {
        if isSettingsOpen {
            self.isHidden = true
            settingsPopOver?.isHidden = false
            isSettingsOpen = false
        } else {
            self.isHidden = false
            settingsPopOver?.isHidden = true
            isSettingsOpen = true
        }
    }
    
    func updateSettingsPosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 50),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 40),
            rightAnchor.constraint(equalTo: superview.rightAnchor, constant: 40)
        ])
        self.backgroundColor = .purple
    }
    
    private func handleRateChanged() {
        updateSettingsUI()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let context = context else { return }
        
        switch context {
            case &kvoRateContext:
                handleRateChanged()
            default:
                break
        }
    }
}
