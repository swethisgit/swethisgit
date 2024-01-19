//
//  NetworkManager.swift
//  HackYou
//
//  Created by Sweda Thiyagarajan on 26/10/2021.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var posts = [Post]()
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data , response, error)  in
                if error != nil {
                    print (error)
                } else {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try  decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
