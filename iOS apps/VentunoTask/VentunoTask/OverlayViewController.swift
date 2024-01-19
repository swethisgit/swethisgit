//
//  OverlayViewController.swift
//  VentunoTask
//
//  Created by Sweda Thiyagarajan on 09/03/2022.
//

import UIKit
import AVKit

class OverlayViewController: UIViewController, URLSessionDownloadDelegate {
    
    @IBOutlet var progessIndicator: UIProgressView!
    @IBOutlet weak var percentDownloaded: UILabel!
    @IBOutlet weak var stopOrResume: UIButton!
    
    var pathToStore: URL!
    var defaultSession: URLSession!
    var downloadTask: URLSessionDownloadTask!
    var restartData: Data?
    var avPlayer : VideoPlayerViewController!
    var toStop: Bool = false
    var url: URL!
    var ongoingProgress: Float! = 0.0
    var downloadedPercentage: String! = "0"
    
    //MARK: - View method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopOrResume.titleLabel?.font = UIFont(name: "Noteworthy", size: 30.0)
        
        
        url = URL(string: Constants.VIDEOLINK)
        let config = URLSessionConfiguration.background(withIdentifier: "\(Bundle.main.bundleIdentifier!).background")
        defaultSession = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue())
        downloadTask = defaultSession.downloadTask(with: url!)
        downloadTask.resume()
    }
    
    //MARK: - Action method
    @IBAction func stopOrResume(_ sender: UIButton) {
        toStop = !toStop
        if toStop {
            downloadTask.cancel(byProducingResumeData:{ data in
                self.restartData = data
            })
            DispatchQueue.main.async {
                self.progessIndicator.progress = self.ongoingProgress
                self.percentDownloaded.text = self.downloadedPercentage
                self.stopOrResume.setTitle(Constants.RESUME, for: UIControl.State.normal)
            }
        } else {
            DispatchQueue.main.async {
                self.stopOrResume.setTitle(Constants.STOP, for: UIControl.State.normal)
            }
            if let resumeData = restartData {
                downloadTask = defaultSession.downloadTask(withResumeData: resumeData)
            } else {
              downloadTask = defaultSession.downloadTask(with: url)
            }
            downloadTask.resume()
        }
    }
    
  //MARK: - Download handlers
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        ongoingProgress = Float(downloadTask.progress.fractionCompleted)
        downloadedPercentage = "\(Int(floor(downloadTask.progress.fractionCompleted * 100)))%"
        DispatchQueue.main.async {
            self.progessIndicator.progress = self.ongoingProgress
            self.percentDownloaded.text = self.downloadedPercentage
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
        print(" resumed %= \(fileOffset) \(expectedTotalBytes)")
//        downloadTask.resume()
    }

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        initiatePlayer(withfile: pathToStore)
    }
    
    func urlSession(_: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
            if let error = error {
                downloadTask.cancel(byProducingResumeData:{ data in
                    self.restartData = data
                })
                DispatchQueue.main.async {
                    self.progessIndicator.progress = self.ongoingProgress
                    self.percentDownloaded.text = self.downloadedPercentage
                    self.stopOrResume.setTitle(Constants.RESUME, for: UIControl.State.normal)
                }
                print("Download error: \(error)")
            } else {
                print("Task finished:  \(String(describing: error))")
            }
        }
    
    //MARK: - Start player
    func initiatePlayer (withfile atPath: URL) {
        avPlayer = VideoPlayerViewController()
        let player = AVPlayer(url: atPath)
        avPlayer.player = player
        self.present(avPlayer, animated: true, completion: nil)
    }
}
