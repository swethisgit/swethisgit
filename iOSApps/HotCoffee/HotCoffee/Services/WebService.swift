//
//  WebService.swift
//  HotCoffee
//
//  Created by Sweda Thiyagarajan on 19/12/2022.
//

import Foundation
struct Resource < T: Codable> {
    let url : URL
}

class webService {
    func load <T>(resource : Resource <T>, completion : @escaping (Result <T,  NetworkError) => void) {
        
    }
}
