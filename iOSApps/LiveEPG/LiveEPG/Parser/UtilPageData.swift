//
//  UtilPageData.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 21/04/2023.
//

import Foundation

open class UtilPageData : ApiKey {
    
    public static let __KEY_EPG_CARD_V2 = "EpgCardV2";
    
    static func getEpgCardV2Widgets(_ mPageData:PageData) -> [JsonObj]
    {
        var mList:[JsonObj] = [JsonObj]()
        
        let mArray = mPageData.getData().optJsonArray(__KEY_EPG_CARD_V2)
        
        for item in mArray {
            if let itemObj = item as? [String:AnyObject] {
                mList.append(JsonObj(itemObj))
            }
        }
        
        return mList
    }
}
