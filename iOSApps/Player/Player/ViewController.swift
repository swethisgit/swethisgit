//
//  ViewController.swift
//  Player
//
//  Created by Sweda Thiyagarajan on 29/06/2023.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    var playPauseButton: PlayPauseButton!
    var settingsButton: SettingsButton!
    var settingsPopOver : SettingsPopOver!
    var selectedBitrate : String?
    var player : AVPlayer?
    public var mPlayerAsset:AVURLAsset?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addPlayer()
    }
    
    
    func addPlayer() {
        guard let url = URL(string: "https://cdn-ott.jentezenfranklin.org/encoded/WhichTeamAreYouOn%3F.m3u8" /*"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4" */) else { return }
        
//        guard let url = URL(string: mediaURL ?? "") else {
//                    return
//                }
                
                mPlayerAsset = AVURLAsset(url: url)
                let keys: [String] = ["playable"]
                
        if let asset = mPlayerAsset{
            asset.loadValuesAsynchronously(forKeys: keys, completionHandler: {
                var error: NSError? = nil
                let status = asset.statusOfValue(forKey: "playable", error: &error)
                switch status {
                    case .loaded:
                        print("DEBUG: Loaded")
                        break
                    case .failed:
                        print("DEBUG: Failed")

                        break
                    case .cancelled:
                        print("DEBUG: Cancelled")

                        break
                    default:
                        print("DEBUG: Default")
                        break
                }
            })
        }
                                                   
        
        
        
//        player = AVPlayer(url: url)
        let item = AVPlayerItem(asset: mPlayerAsset!)
//        player = AVPlayer(url: url)
        player = AVPlayer(playerItem: item)
        player?.rate = 1 //auto play
        let playerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = false
        
        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
        
        playPauseButton = PlayPauseButton()
        playPauseButton.avPlayer = player
        view.addSubview(playPauseButton)
        playPauseButton.setup(in: self)
        
        let  settingsPopOverNib = UINib(nibName: "SettingsPopOver", bundle: nil)
        settingsPopOver = settingsPopOverNib.instantiate(withOwner: self, options: nil).first as? SettingsPopOver
        settingsPopOver.frame = CGRect(x:(self.view.frame.size.width )-100, y: (self.view.frame.size.height )-140, width: 80, height: 100)
        settingsPopOver.avPlayer = player
        settingsPopOver.parentController = self
        view.addSubview(settingsPopOver)
        
        let nib = UINib(nibName: "SettingsButton", bundle: nil)
        settingsButton = nib.instantiate(withOwner: self, options: nil).first as? SettingsButton
        settingsButton.frame = CGRect(x:(self.view.frame.size.width )-70, y: (self.view.frame.size.height )-90, width: 30, height: 30)
        settingsButton.avPlayer = player
        settingsButton.parentController = self
        settingsButton.settingsPopOver = settingsPopOver
        settingsButton.isSettingsOpen = false
        settingsButton.updateSettingsUI()
        view.addSubview(settingsButton)
        
        settingsPopOver.settingsButton = settingsButton
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        playPauseButton.updateUI()
    }
    
//    func setBitRate(_ definition: String) {
//
//        var maxBitRate: Double = 0
//        switch definition {
//            case "1080":
//                maxBitRate = 6000000
//            case "720":
//                maxBitRate = 4000000
//            case "480":
//                maxBitRate = 700000
//            case "360":
//                maxBitRate = 400000
//            case "Auto":
//                maxBitRate = 0
//            default:
//                maxBitRate = 0
//        }
//        player?.currentItem?.preferredPeakBitRate = maxBitRate
//        print("Playing in Bit Rate \(String(describing: player?.currentItem?.preferredPeakBitRate))")
//    }
    
    
    func setBitRate(_ definition: String) {
        
        var maxBitRate: Double = 0
        switch definition {
            case "1080":
                maxBitRate = 6000000
            case "720":
                maxBitRate = 4000000
            case "480":
                maxBitRate = 2000000
            case "360":
                maxBitRate = 1500000
            case "Auto":
                maxBitRate = 0
            default:
                maxBitRate = 0
        }
        player?.currentItem?.preferredPeakBitRate = maxBitRate
        print("Playing in Bit Rate \(String(describing: player?.currentItem?.preferredPeakBitRate))")
        let accessLog =  player?.currentItem?.accessLog()
        if accessLog != nil && !accessLog!.events.isEmpty {
            var i:Int = 0
            for event in accessLog!.events{
                print("observedBitrate \(i) : \(String(describing: event.observedBitrate))")
                print("indicatedBitrate \(String(describing: event.indicatedBitrate))")
                i += 1
            }
        }
    }
}

