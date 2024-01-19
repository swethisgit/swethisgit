//
//  EPGShowCard.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 27/06/2022.
//

import Foundation

struct EpgCardV2 : Codable {
    
   public let epgAvailable : EpgAvailable?
    
    private enum CodingKeys: String, CodingKey {
        case epgAvailable = "EpgCardV2"
    }
    
    struct EpgAvailable : Codable {
        
        var CanShowEPG : Bool?
        
        private enum CodingKeys: String, CodingKey {
            case CanShowEPG = "CanShowEPG"
        }
    }
}
