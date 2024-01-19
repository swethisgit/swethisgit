//
//  NodeRoute.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation

open class NodeRoute : BaseNode {

    public override init(_ obj: JsonObj) {
        super.init(obj)
    }

    public func getPage() -> String {
        return getObj().optString( ApiKey.__KEY_PAGE, "")
    }
    
    public func getApiUrl() -> String {
        return getObj().optString( ApiKey.__KEY_API_URL, "")
    }
    
    public func getIntent() -> String {
        return getObj().optString( ApiKey.__KEY_INTENT, "")
    }
}
