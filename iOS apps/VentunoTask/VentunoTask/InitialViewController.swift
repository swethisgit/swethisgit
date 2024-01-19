//
//  InitialViewController.swift
//  VentunoTask
//
//  Created by Sweda Thiyagarajan on 07/03/2022.
//

import UIKit
import AVKit
import AVFoundation

class InitialViewController: UIViewController {

    var overlayViewController: OverlayViewController!
    var avPlayer : VideoPlayerViewController!
    var metadataCollector: AVPlayerItemMetadataCollector!
    
    //MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBAction
    @IBAction func startDownload(_ sender: Any) {
        let url: URL = URL(string: "https://ax-transcode.s3.amazonaws.com/interactive_hls/sample/1_test_asset.m3u8")!
        initiatePlayer(withfile: url)
        
        /*
        let storagePath = getDocumentsDirectory()
        let storedPath = checkWithFileManager()

        guard let existingPath = storedPath else {
            doDownload(path: storagePath)
            return
        }
        initiatePlayer(withfile: existingPath) */
    }
    
    //MARK:- Check for existing file
    func checkWithFileManager () -> URL? {
        let fm = FileManager.default
        let docsurl = try! fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let storedPath = docsurl.appendingPathComponent(Constants.VIDEONAME)
        if fm.fileExists(atPath: storedPath.path) {
            return storedPath
        }
        return nil
    }
    
    //MARK: - Intiate player
    func initiatePlayer (withfile atPath: URL) {
        avPlayer = VideoPlayerViewController()
        avPlayer.url = atPath
        let player = AVPlayer(url: atPath)
        avPlayer.player = player
        present(avPlayer, animated: true, completion: nil)

    }
    
    //MARK: - Web request handlers
    func getDocumentsDirectory () -> URL{
        let documentDirectory = NSSearchPathForDirectoriesInDomains(                         .documentDirectory,
                    .userDomainMask,
                    true)
        print( documentDirectory[0])
        let documentsUrl:URL =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationFileUrl = documentsUrl.appendingPathComponent(Constants.VIDEONAME)
        return destinationFileUrl
    }
    
    func doDownload(path toStore: URL) {
        overlayViewController = self.storyboard?.instantiateViewController(withIdentifier: "overlay") as? OverlayViewController
        overlayViewController.pathToStore = toStore
        self.present(overlayViewController, animated: true, completion: nil)
    }
}

