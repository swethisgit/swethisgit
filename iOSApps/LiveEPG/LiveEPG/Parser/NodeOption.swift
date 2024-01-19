//
//  NodeOption.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class NodeOption: BaseNode {
    
    override init(_ obj: JsonObj) {
        super.init(obj)
    }
    
    public func getLabel() -> String{
        return getObj().optString(ApiKey.__KEY_LABEL, "")
    }
    
    public func getCategoryId() -> String{
        return getObj().optJsonObj(ApiKey.__KEY_ACTION).optJsonObj(ApiKey.__KEY_URL_PARAMS).optString(ApiKey.__KEY_CATEGORY_ID, "")
    }

    public func getValue() -> String{
        return getObj().optString(ApiKey.__KEY_VALUE, "")
    }

    public func getPrimaryLbl() -> String {
        return getObj().optString(ApiKey.__KEY_PRIMARY_LABEL, "")
    }
    
    public func getSecondaryLbl() -> String {
        return getObj().optString(ApiKey.__KEY_SECONDARY_LABEL, "")
    }
    
    public func getUrl() -> String {
        return getObj().optJsonObj(ApiKey.__KEY_ACTION).optJsonObj(ApiKey.__KEY_URL_PARAMS).optString(ApiKey.__KEY_URL)
    }
    
    public func getDateParam() -> String {
        return getObj().optJsonObj(ApiKey.__KEY_ACTION).optJsonObj(ApiKey.__KEY_URL_PARAMS).optString(ApiKey.__KEY_DATE)
    }
}
