//
//  BaseNode.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class BaseNode : ApiKey {
    let mObj:JsonObj
    
    public init(_ obj:JsonObj) {
        mObj = obj;
    }
    
    public func getObj() -> JsonObj {
        return mObj
    }
    
    public func getData() -> JsonObj {
        return mObj.optJsonObj(BaseWidget.__KEY_DATA)
    }
    
    public func getMeta() -> JsonObj {
        return mObj.optJsonObj(BaseWidget.__KEY_META)
    }
    
    public func getJSONArrayItem(_ key:String) -> [AnyObject]
    {
        return mObj.optJsonArray(key)
    }
    
    public func getJSONObject(_ key:String) -> JsonObj
    {
        return mObj.optJsonObj(key)
    }
    
    public func getJSONObject(_ obj:JsonObj,_ key:String) -> JsonObj
    {
        return  obj.optJsonObj(key)
    }
    
    
    public func getUrlOfType(_ key:String, _ type:String, _ fallback:String) -> String {
        return type==getObj().optJsonObj(key).optString(ApiKey.__KEY_TYPE)
            ? getObj().optJsonObj(key).optString(ApiKey.__KEY_URL, fallback) : fallback;
    }
    
    public func getLabels() -> NodeLabel{
        return NodeLabel(getObj().optJsonObj(BaseWidget.__KEY_LABELS))
    }
    
    public func labels() -> NodeLabel{
        return NodeLabel(getObj().optJsonObj(BaseWidget.__KEY_LABELS))
    }

}
