//
//  VtnJson.swift
//  baselib
//
//  Created by Ventuno Technologies on 28/11/18.
//  Copyright © 2018 ventuno. All rights reserved.
//

import Foundation

public class VtnJson
{
    private var mJson:[String : AnyObject]?
    
    public init() {
        
    }
    public init(_ data: Data) {
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject]
            {
                self.mJson = json
            }
        } catch {
            
        }
    }
    
    public init(_ string: String) {
        
        if let data = string.data(using: String.Encoding.utf8) {
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as? [String : AnyObject]
                {
                    self.mJson = json
                }
            } catch {
                
            }
        }
    }
    
    public init(_ json:[String : AnyObject]) {
        self.mJson = json
    }
    
    public func isValid() -> Bool
    {
        if let _ = mJson {
            return true
        }
        return false
    }
    
    public func has(_ key:String) -> Bool
    {
        if let _ = mJson?[key] {
            return true
        }
        return false
    }
    
    public func optBoolean(_ key:String) -> Bool
    {
        return optBoolean(key, false)
    }
    
    public func optBoolean(_ key:String, _ fallback: Bool) -> Bool
    {
        var mFallback:Bool = fallback
        if let strFallback = Bool(optString(key).lowercased()) {
            mFallback = strFallback
        }
        if let _ = mJson?[key] { return mJson![key] as? Bool ?? mFallback } else { return mFallback }
    }
    
    public func optString(_ key:String) -> String
    {
        return optString(key,"")
    }
    
    public func optString(_ key:String, _ fallback: String) -> String
    {
        if let _ = mJson?[key] { return mJson![key] as? String ?? fallback } else { return fallback }
    }
    
    public func optInt(_ key:String) -> Int64
    {
        return optInt(key,0)
    }
    
    public func optInt(_ key:String, _ fallback: Int64) -> Int64
    {
        var mFallback:Int64 = fallback
        if let strFallback = Int64(optString(key)) {
            mFallback = strFallback
        }
        if let _ = mJson?[key] { return mJson![key] as? Int64 ?? mFallback } else { return mFallback }
    }
    
    public func optDouble(_ key:String) -> Double
    {
        return optDouble(key,0)
    }
    
    public func optDouble(_ key:String, _ fallback: Double) -> Double
    {
        var mFallback:Double = fallback
        if let strFallback = Double(optString(key)) {
            mFallback = strFallback
        }
        
        if let _ = mJson?[key] { return mJson![key] as? Double ?? mFallback } else { return mFallback }
    }
    
    public func optJsonObj(_ key:String) -> VtnJson
    {
        let fallback:[String : AnyObject] = [String : AnyObject]()
        return optJsonObj(key, VtnJson(fallback))
    }
    
    public func optJsonObj(_ key:String, _ fallback: VtnJson) -> VtnJson
    {
        if let _ = mJson?[key] {
            if let obj = mJson![key] as? [String : AnyObject] {
                return VtnJson(obj)
            }
            else{
                return fallback
            }
        } else { return fallback }
    }
    
    public func getObj() -> [String : AnyObject]?
    {
        return mJson
    }
    
    public func optJsonArray(_ key:String) -> [AnyObject]
    {
        let fallback = [AnyObject]()
        if let _ = mJson?[key] {
            if let obj = mJson![key] as? [AnyObject] {
                return obj
            }
            else{
                return fallback
            }
        } else { return fallback }
        
    }
    
    public func JSONStringify() -> String {
        let options:JSONSerialization.WritingOptions = JSONSerialization.WritingOptions.prettyPrinted
        if let json = mJson {
            if JSONSerialization.isValidJSONObject(json) {
                do {
                    let data = try JSONSerialization.data(withJSONObject: json, options: options)
                    if let string = String(data: data, encoding: .utf8) {
                        return string
                    }
                } catch {
                    
                }
            }
        }
        return ""
    }
    
    
}
