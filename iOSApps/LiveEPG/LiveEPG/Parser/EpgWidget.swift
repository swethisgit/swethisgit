//
//  EpgWidget.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class EpgWidget : BaseWidget {
   
    public static let __KEY_TIMELINE = "timeline";
    public static let __KEY_INTERVAL = "interval";
    public static let __KEY_CATEGORY_SELECTION = "categorySelection";
    public static let __KEY_REFRESH_EPG_URL = "refresh_epg_url";
    
    public override init(_ widget: JsonObj) {
        super.init(widget)
    }
    
    public func getEpgDateTab() -> [EpgTab]
    {
        var mList:[EpgTab] = [EpgTab]()
        
        let mArray = getJSONArrayDataItem(ApiKey.__KEY_TABS)
        
        for item in mArray {
            if let itemObj = item as? [String:AnyObject] {
                mList.append(EpgTab(JsonObj(itemObj)))
            }
        }
        
        return mList
    }
    
    public func getTimelineInterval() -> Int64
    {
        return getJSONObjectDataItem(EpgWidget.__KEY_TIMELINE).optInt(EpgWidget.__KEY_INTERVAL, 30)
    }
    
    public func getExpandLabel() -> String {
        return getJSONObjectDataItem(ApiKey.__KEY_EXPAND_COLLAPSE_BUTTON).optString(ApiKey.__KEY_EXPAND_LABEL)
    }
    
    public func getCollapseLabel() -> String {
        return getJSONObjectDataItem(ApiKey.__KEY_EXPAND_COLLAPSE_BUTTON).optString(ApiKey.__KEY_COLLAPSE_LABEL)
    }
    
    public func getOptions() -> [NodeOption]
    {
        var mList:[NodeOption] = [NodeOption]()
        
        let mArray = getJSONObjectDataItem(ApiKey.__KEY_PRIMARY_FILTER).optJsonObj(ApiKey.__KEY_DATA).optJsonArray(ApiKey.__KEY_OPTIONS)
        
        for item in mArray {
            if let itemObj = item as? [String:AnyObject] {
                mList.append(NodeOption(JsonObj(itemObj)))
            }
        }
        
        return mList
    }
    
    public func getTodayURL () -> String {
        let mArray = getJSONObjectDataItem(ApiKey.__KEY_SECONDARY_FILTER).optJsonObj(ApiKey.__KEY_DATA).optJsonArray(ApiKey.__KEY_OPTIONS)
        let jsonObj = mArray[0] as? [String : AnyObject]
        if let jsonObj = jsonObj {
            let jsonVal = JsonObj(jsonObj)
            return jsonVal.optJsonObj(ApiKey.__KEY_ACTION).optString(ApiKey.__KEY_URL)
        }
        return ""
    }
    
    public func getSecondaryOptions () -> [NodeOption] {
        var optionsAvailable = [NodeOption]()
        let mArray = getJSONObjectDataItem(ApiKey.__KEY_SECONDARY_FILTER).optJsonObj(ApiKey.__KEY_DATA).optJsonArray(ApiKey.__KEY_OPTIONS)
        for json in mArray {
            let jsonObj = json as? [String : AnyObject]
            if let jsonRaw = jsonObj {
                 let json = NodeOption(JsonObj(jsonRaw))
                optionsAvailable.append(json)
            }
        }
        return optionsAvailable
    }
    
    public func getPlaceHolder() -> String
    {
        return getJSONObjectDataItem(EpgWidget.__KEY_CATEGORY_SELECTION).optJsonObj(ApiKey.__KEY_DATA).optString(ApiKey.__KEY_PLACE_HOLDER)
    }
    
    public func canShowCategorySelection() -> Bool {
        return getJSONObjectDataItem(EpgWidget.__KEY_CATEGORY_SELECTION).optJsonObj(ApiKey.__KEY_META).optJsonObj(EpgWidget.__KEY_CATEGORY_SELECTION).optBoolean(ApiKey.__META_KEY_CAN_SHOW)
    }
    
    public func getRefreshEPGURL() -> NodeUrl {
        return NodeUrl( getData().optJsonObj(EpgWidget.__KEY_REFRESH_EPG_URL))
    }
    
}
