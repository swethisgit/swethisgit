//
//  WebServices.swift
//  GoodNews
//
//  Created by Sweda Thiyagarajan on 18/12/2022.
//

import Foundation

class WebServices {
    
    func getArticles(url : URL, completion : @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print (error)
                completion(nil)
            } else if let data = data {
                print (data)
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let list = articleList {
                    completion(list.articles)
                }
            }
        }.resume()
    }
}
