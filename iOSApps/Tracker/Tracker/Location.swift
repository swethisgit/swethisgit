//
//  Locations.swift
//  Tracker
//
//  Created by Sweda Thiyagarajan on 17/07/2021.
//

import Foundation

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    
    static let example = Location(id: 1, name: "Great Mountains", country: "Icdeland", description: "Cold place", more: "NExt to be added", latitude: 234.2323, longitude: 12.2323, heroPicture: "smokies", advisory: "take jacket")
}
