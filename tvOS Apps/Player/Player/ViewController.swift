//
//  ViewController.swift
//  Player
//
//  Created by Sweda Thiyagarajan on 12/07/2023.
//

import UIKit
import AVKit

class ViewController: UIViewController {
    var sideBarView : SidebarView?
    var settingsBtn : UIButton?
    var isSidebarHidden : Bool = true
    var player : AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string:  "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }
        
        player = AVPlayer(url: url)
        player?.rate = 1 //auto play
        let playerFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        playerViewController.view.frame = playerFrame
        playerViewController.showsPlaybackControls = false
        addChild(playerViewController)
        view.addSubview(playerViewController.view)
        playerViewController.didMove(toParent: self)
                
        settingsBtn = UIButton()
        settingsBtn?.frame = CGRect(x: (self.view.frame.size.width )-150, y: 0, width: 50, height: 50)
        settingsBtn?.addTarget(self, action: #selector(toggleOptions), for: .primaryActionTriggered)
        settingsBtn?.imageView?.image = UIImage(systemName: "gearshape.fill")
        settingsBtn?.setImage(UIImage(systemName: "gearshape.fill"), for: .normal)
        settingsBtn?.setTitle("", for: .normal)
        settingsBtn?.backgroundColor = .darkGray
        if let settingsBtn = settingsBtn {
            view.addSubview(settingsBtn)
        }

        
        // Do any additional setup after loading the view.
        let sideBarViewNib = UINib(nibName: "SidebarView", bundle: nil)
        sideBarView = sideBarViewNib.instantiate(withOwner: self).first as? SidebarView
        sideBarView?.frame = CGRect(x: (self.view.frame.size.width )-370, y: 0, width: 365, height: self.view.frame.size.height)
        sideBarView?.backgroundColor = .link
        if let sideBarView = sideBarView {
            view.addSubview(sideBarView)
            sideBarView.viewController = self
            sideBarView.isHidden = true
        }
       
    }

    @objc func toggleOptions() {
        sideBarView?.isHidden = !isSidebarHidden
        isSidebarHidden = !isSidebarHidden
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        guard let nextFocusedView = context.nextFocusedView else {
            return
        }
         print("nextFocusedView: \(nextFocusedView)")
        if nextFocusedView === AVPlayerViewController.self {
            settingsBtn?.setNeedsFocusUpdate()
        }
       
    }
    
    
}

