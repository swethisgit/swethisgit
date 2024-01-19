//
//  BasePageData.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 21/04/2023.
//

import Foundation

class BasePageData : ApiKey {
    public static let TYPE_PAGE = "Page";
    public static let TYPE_WIDGET = "Widget";
    public static let TYPE_ERROR = "Error";
    public static let TYPE_SUCCESS = "Success";
    public static let __KEY_WIDGET = "widget";

    private let mObj:JsonObj
    
    public init(_ mObj:JsonObj) {
        self.mObj = mObj
    }
    
    public func getType() -> String {
        return mObj.optString(ApiKey.__KEY_TYPE,"")
    }

    public func getData() -> JsonObj {
        return mObj.optJsonObj(ApiKey.__KEY_DATA)
    }

    public func getMeta() -> JsonObj {
        return mObj.optJsonObj(ApiKey.__KEY_META)
    }

    private func getJSONArray(_ obj:JsonObj, _ key:String) -> [AnyObject]
    {
        return obj.optJsonArray(key)
    }

    private func getJSONObject(_ obj:JsonObj, _ key:String) -> JsonObj
    {
        return obj.optJsonObj(key)
    }

    public func getJSONArrayDataItem(_ key:String) -> [AnyObject]
    {
        return getJSONArray(getData(), key)
    }
    public func getJSONObjectDataItem(_ key:String) -> JsonObj
    {
        return getJSONObject(getData(), key);
    }

    public func getJSONArrayMetaItem(_ key:String) -> [AnyObject]
    {
        return getJSONArray(getMeta(), key);
    }
    public func getJSONObjectMetaItem(_ key:String) -> JsonObj
    {
        return getJSONObject(getMeta(), key);
    }

    public func isPageResponse() -> Bool
    {
        return BasePageData.TYPE_PAGE == getType();
    }
    public func isWidgetResponse() -> Bool
    {
        return BasePageData.TYPE_WIDGET == getType();
    }

    public func isSuccessResponse() -> Bool
    {
        return BasePageData.TYPE_SUCCESS == getType();
    }
    public func isErrorResponse() -> Bool
    {
        return BasePageData.TYPE_ERROR == getType();
    }

    public func getWidgets() -> [AnyObject]
    {
        return getJSONArrayDataItem(BasePageData.__KEY_WIDGETS)
    }
    public func getWidget() -> JsonObj
    {
        return getJSONObjectDataItem(BasePageData.__KEY_WIDGET)
    }
    
}
