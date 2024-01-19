//
//  GridItems.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 23/02/2023.
//

import Foundation
import SwiftUI

struct GridItems  {
    var count:Int
    var height:CGFloat
    var spacing:CGFloat
    var gridRow = [GridItem]()
    init(count: Int, height: CGFloat, spacing: CGFloat) {
        self.count = count
        self.height = height
        self.spacing = spacing
    }
    
    mutating func getLogoGridItems () -> [GridItem] {
        for _ in (0...self.count) {
            gridRow.append(GridItem(.fixed(height), spacing: spacing))
        }
        return gridRow
    }
}

struct ShowGridItems {
    var count:Int
    var width:CGFloat
    var height:CGFloat
    var spacing:CGFloat
    var gridRow = [GridItem]()
    init(count: Int, width:CGFloat, height: CGFloat, spacing: CGFloat) {
        self.count = count
        self.width = width
        self.height = height
        self.spacing = spacing
    }
    
    mutating func getChannel1GridItems () -> [GridItem] {
        for _ in (0...self.count) {
            gridRow.append(GridItem(.fixed(height), spacing: spacing))
        }
        return gridRow
    }
    
    mutating func getChannel2GridItems () -> [GridItem] {
        for _ in (0...self.count) {
            gridRow.append(GridItem(.fixed(height), spacing: spacing))
        }
        return gridRow
    }

}
