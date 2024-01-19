//
//  UtilNode.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 24/04/2023.
//

import Foundation

open class UtilNode : ApiKey {
    
    public static func getThumbnail_r1x1_w150(_ mJson:JsonObj) -> String
    {
        return mJson.optJsonObj(__KEY_THUMBNAILS).optJsonObj(__DIMEN_RATIO_KEY_1x1).optString(__DIMEN_SIZE_KEY_150)
    }
    
}
