//
//  Card.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 15/04/2023.
//

import Foundation
open class CardData : ApiKey {
    private let mObj:JsonObj

    public init(_ obj:JsonObj) {
        mObj = obj;
    }
    
    public func getData() -> JsonObj {
        return mObj.optJsonObj(ApiKey.__KEY_DATA)
    }
    
    public func getTitle() -> String {
        return getData().optString(getTitleKey(),"")
    }
    
    func getTitleKey()  -> String  {
        return ApiKey.__KEY_TITLE
    }

    public func getSubTitle() -> String {
        return getData().optString(getTitleKey(),"")
    }
    
    func getSubTitleKey()  -> String  {
           return ApiKey.__KEY_SUB_TITLE
    }

    public func getDescription() -> String{
        return getData().optString(BaseWidget.__KEY_DESCRIPTION,"");
    }

    public func getOverline() -> String{
        return getData().optString(ApiKey.__KEY_OVER_LINE,"");
    }
    
    public func getImageUrl() -> String {
        return getData().optJsonObj(ApiKey.__KEY_THUMBNAILS).optJsonObj(ApiKey.__DIMEN_RATIO_KEY_1x1).optString(ApiKey.__DIMEN_SIZE_KEY_150)
    }
    
    public func getOverlineImageUrl() -> String {
        return getData().optJsonObj(ApiKey.__KEY_OVERLINEICON).optJsonObj(ApiKey.__DIMEN_RATIO_KEY_1x1).optString(ApiKey.__DIMEN_SIZE_KEY_150)
    }
    
    public func getDurationValue() -> Double {
        return getData().optJsonObj(ApiKey.__KEY_DURATION).optDouble(ApiKey.__KEY_VALUE)
    }
    
    public func getElapsedTime() -> Double {
        return getData().optJsonObj(ApiKey.__KEY_ELAPSED_TIME).optDouble(ApiKey.__KEY_VALUE)
    }
    
    public func getDurationInMinsStr() -> String {
        return getData().optJsonObj(ApiKey.__KEY_DURATION).optString(ApiKey.__KEY_FORMATTED_DURATION)
    }
}
