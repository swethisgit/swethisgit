//
//  EPGShowCard.swift
//  EPGComponent
//
//  Created by Sweda Thiyagarajan on 27/06/2022.
//

import Foundation

struct EpgCardV2 : Codable {
        
//    let title : String
    let channelCard : [channelCard]?
    
    private enum CodingKeys: String, CodingKey {
        case channelCard = "EpgCardV2"
//        case title = "title"
    }
    
    struct channelCard : Codable {
        
        let cards : [card]?
        
        private enum CodingKeys: String, CodingKey {
            case cards = "cards"
        }
    }
    
    struct card : Codable {
        
        let title : String?
        let interval : Interval?
        let thumbnails : Thumbnail1X1?
        
        private enum CodingKeys: String, CodingKey {
            case title = "title"
            case interval = "interval"
            case thumbnails = "thumbnails"
        }
    }
    
    struct Interval : Codable {
        let formattedText : String?
        let startValue : String?
        let endValue : String?
        
        private enum CodingKeys: String, CodingKey {
            case formattedText = "formatted_text"
            case startValue = "start_value"
            case endValue = "end_value"
        }
    }
    
    struct Thumbnail : Codable {
            let url_150 : String?
            let url_320 : String?
            let url_450 : String?
            let url_640 : String?
            let url_800 : String?
            let url_1024 : String?
            
            private enum CodingKeys : String, CodingKey {
                case url_150 = "150"
                case url_320 = "320"
                case url_450 = "450"
                case url_640 = "640"
                case url_800 = "800"
                case url_1024 = "1024"
            }
        }
        
        struct Thumbnail1X1  : Codable {
            let oneXone : Thumbnail?
            
            private enum CodingKeys :String, CodingKey {
                case oneXone = "1x1"
            }
        }
}
