//
//  PageData.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 21/04/2023.
//

import Foundation

 class PageData : BasePageData {
    public static let __KEY_RESPONSE = "response";
    public static let __KEY_BACKGROUND_IMAGE = "backgroundImage";
    public static let __VALUE_SUCCESS = "success";
    
    
    public override init(_ mObj: JsonObj) {
        super.init(mObj)
    }
     
    
}
