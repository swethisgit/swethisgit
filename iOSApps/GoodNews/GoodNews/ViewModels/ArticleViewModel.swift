//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Sweda Thiyagarajan on 19/12/2022.
//

import Foundation

struct ArticleListModel {
     let articleList : [Article]
}

extension ArticleListModel {
    var noOfSections : Int{
        return 1
    }
    
    func noOfRows (section : Int) -> Int {
        return self.articleList.count
    }
    
    func articleAtIndex (index : Int) -> Article {
        let article = self.articleList[index]
        return article
    }
}

struct ArticleViewModel {
    private let article : Article
}

extension ArticleViewModel {
    init(_ article : Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title : String {
        return self.article.title ?? ""
    }
    
    var description : String {
        return  self.article.description ?? ""
    }
}
