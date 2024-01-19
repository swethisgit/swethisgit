//
//  EpgInterval.swift
//  HomeLiveApp
//
//  Created by Sweda Thiyagarajan on 18/04/2023.
//

import Foundation
open class EpgInterval : BaseNode {
    
    public static let __KEY_FORMATTED_TEXT = "formatted_text"
    public static let __KEY_START_VALUE = "start_value"
    public static let __KEY_END_VALUE = "end_value"
    
    
    override init(_ obj: JsonObj) {
        super.init(obj)
    }
    
    public func getFormattedText() -> String{
        return getObj().optString(EpgInterval.__KEY_FORMATTED_TEXT)
    }
    
    public func startValueAsString() -> String {
        if getObj().optString(EpgInterval.__KEY_START_VALUE)  == "" {
            return String(startValueAsDouble())
        }
        return getObj().optString(EpgInterval.__KEY_START_VALUE)
    }
    
    public func endValueAsString() -> String {
        if getObj().optString(EpgInterval.__KEY_END_VALUE)  == "" {
            return String(endValueAsDouble())
        }
        return getObj().optString(EpgInterval.__KEY_END_VALUE)
    }
    
    public func startValueAsDouble() -> Double {
        return getObj().optDouble(EpgInterval.__KEY_START_VALUE)
    }
    
    public func endValueAsDouble() -> Double {
        return getObj().optDouble(EpgInterval.__KEY_END_VALUE)
    }
    
}
