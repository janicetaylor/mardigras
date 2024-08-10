//
//  Place.swift
//  MardiGras
//
//  Created by Janice on 7/24/24.
//

import Foundation

struct Place: Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle: String 
    var location: String
    var latitude: Float 
    var longitude: Float
    var thumbnailUrl: String
}
