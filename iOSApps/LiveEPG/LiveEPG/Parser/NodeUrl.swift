//
//  NodeUrl.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class NodeUrl : BaseNode {
    
    public override init(_ obj: JsonObj) {
        super.init(obj)
    }
    
    public func getLabel() -> String{
        return getObj().optString( ApiKey.__KEY_LABEL, "")
    }
    
    public func getType() -> String{
        return getObj().optString( ApiKey.__KEY_TYPE, "")
    }
    
    public func isNavUrl() -> Bool {
        return getType()==ApiKey.__KEY_NAV_URL
    }
    
    public func getNavURL() -> String {
        return isNavUrl() ? getObj().optString( ApiKey.__KEY_URL, "") : ""
    }
    
    public func isDataUrl() -> Bool {
        return getType()==ApiKey.__KEY_DATA_URL
    }
    
    public func getDataURL() -> String {
//        return "http://ottapi.ventunotech.com/v1/ott/getEpgLiveData/62de5649e704b/731"
        return isDataUrl() ? getObj().optString( ApiKey.__KEY_URL, "") : ""
    }
    
    public func isExtNavURL() -> Bool {
        return getType()==ApiKey.__KEY_EXT_NAV_URL
    }
    
    public func getExtNavURL() -> String {
        return isExtNavURL() ? getObj().optString( ApiKey.__KEY_URL, "") : ""
    }
    
    public func hasRoute() -> Bool {
        return getObj().has(ApiKey.__KEY_ROUTE)
    }
    
    public func getRoute() -> NodeRoute {
        return NodeRoute(getObj().optJsonObj(ApiKey.__KEY_ROUTE))
    }
    
    public func getUrlParams() -> [(key:String,value:String?)]
    {
        var mUrlParams = [(key:String,value:String?)]()
    
        if let keyValuePair = getObj().optJsonObj(ApiKey.__KEY_URL_PARAMS).getObj()
        {
            for keyValue in keyValuePair {
//                VtnLog.trace("url params: \(keyValue.key) = \(keyValue.value)")
                mUrlParams.append((key: keyValue.key, value: "\(keyValue.value)"))
            }
        }
        
        return mUrlParams
    }
    
}

