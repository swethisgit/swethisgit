//
//  ChannelModel.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation

class ChannelModel {
    var title : String = ""
    var thumbnail : String = ""
    var thumbnailURL : URL? {
        let url = URL(string: self.thumbnail)
        if let url = url {
            return url
        }
        return nil
    }
}
