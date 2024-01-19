//
//  Article.swift
//  GoodNews
//
//  Created by Sweda Thiyagarajan on 18/12/2022.
//

import Foundation

struct ArticleList : Decodable {
    let articles : [Article]
}

struct Article : Decodable {
    let title : String?
    let description : String?
}
