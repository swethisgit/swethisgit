//
//  Results.swift
//  HackYou
//
//  Created by Sweda Thiyagarajan on 26/10/2021.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable , Identifiable{
    let points: Int
    let title: String
    let objectID: String
    let url: String?
    var id: String {
        return objectID
    }
}
