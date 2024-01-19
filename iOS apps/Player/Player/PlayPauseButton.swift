//
//  PlayPauseButton.swift
//  Player
//
//  Created by Sweda Thiyagarajan on 29/06/2023.
//

import Foundation
import AVKit

class PlayPauseButton: UIView {
    var kvoRateContext = 0
    var avPlayer: AVPlayer?
    var isPlaying: Bool {
        return avPlayer?.rate != 0 && avPlayer?.error == nil
    }
    
    func addObservers() {
        avPlayer?.addObserver(self, forKeyPath: "rate", options: .new, context: &kvoRateContext)
    }
    
    func setup(in container: UIViewController) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        addGestureRecognizer(gesture)
        

        updatePosition()
        updateUI()
//        updateSettingsPosition()
//        updateSettingsUI()
        addObservers()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        updateStatus()
        updateUI()
    }
    

    private func updateStatus() {
        if isPlaying {
            avPlayer?.pause()
        } else {
            avPlayer?.play()
        }
    }
    
    func updateUI() {
        if isPlaying {
            setBackgroundImage(name: "pause")
        } else {
            setBackgroundImage(name: "play")
        }
    }
    
    func updateSettingsUI() {
        setBackgroundImageForSettings(name: "gearshape")
    }
    
    func updatePosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 50),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
           
        ])
    }
    
    func updateSettingsPosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 50),
            bottomAnchor.constraint(equalToSystemSpacingBelow: superview.topAnchor, multiplier: 80),
            rightAnchor.constraint(equalToSystemSpacingAfter: superview.rightAnchor, multiplier: 40)
        ])
        
        
    }
    
    private func setBackgroundImage(name: String) {
        UIGraphicsBeginImageContext(frame.size)
        UIImage(systemName: name)?.draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        backgroundColor =  UIColor(patternImage: image)
    }
    
    private func setBackgroundImageForSettings(name: String) {
        UIGraphicsBeginImageContext(frame.size)
        UIImage(systemName: name)?.draw(in: bounds)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()
        backgroundColor =  UIColor(patternImage: image)
        
//        UIGraphicsBeginImageContext(frame.size)
//        settingsImage = UIImage(systemName: name)
//        settingsImage?.draw(in: bounds)
////        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return }
//        UIGraphicsEndImageContext()
////        backgroundColor = UIColor(patternImage: image )
    }
    
    private func handleRateChanged() {
        updateUI()
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
