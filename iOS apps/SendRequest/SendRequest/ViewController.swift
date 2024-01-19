//
//  ViewController.swift
//  SendRequest
//
//  Created by Sweda Thiyagarajan on 03/03/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func sendRequest(_ sender: Any) {
        
        let url = URL(string: "https://web.ventunotech.com/platform/index.php/vast_request_3_0/vast/631ebeae9f67b/preroll/all/1303109/0/22d78021-4723-4378-a7b9-2c329e4c6070/17345/false/1303109/IzojNDUwIzojMzI1/3E58AAE4-A55A-4725-857E-1D1FE21159D6//")!
        var request = URLRequest(url: url)
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                print ("error: \(error)")
            } else if let data = data {
                // Handle HTTP request response
//                print ("data: \(response)")
                print(String(data: data, encoding: .utf8)!)
            } else {
                // Handle unexpected error
            }
        }
        task.resume()
        
    }
}

