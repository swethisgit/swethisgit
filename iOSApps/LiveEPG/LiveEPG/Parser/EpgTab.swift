//
//  EpgTab.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class EpgTab : BaseNode {

    public static let __KEY_INTERVAL = "interval"
    
    public override init(_ obj: JsonObj) {
        super.init(obj)
    }
    
    
    public func getTitle() -> String
    {
        return getObj().optString(ApiKey.__KEY_TITLE, "")
    }
    
    public func getSubLine() -> String
    {
        return getObj().optString(ApiKey.__KEY_SUB_LINE, "")
    }
    
    public func getAction() -> NodeUrl
    {
        return NodeUrl(getJSONObject(ApiKey.__KEY_ACTION))
    }
    
    public func getImageUrl() -> String {
        return getObj().optJsonObj(ApiKey.__KEY_THUMBNAILS).optJsonObj(ApiKey.__DIMEN_RATIO_KEY_1x1).optString(ApiKey.__DIMEN_SIZE_KEY_150)
    }
    
    public func getInterval() -> EpgInterval
    {
        return EpgInterval(getJSONObject(EpgTab.__KEY_INTERVAL))
    }
    
    public func isActive() -> Bool
    {
        return getObj().optBoolean(ApiKey.__META_KEY_IS_ACTIVE, false)
    }
}
