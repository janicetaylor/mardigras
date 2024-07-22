//
//  Parade.swift
//  MardiGras
//
//  Created by Janice on 7/21/24.
//

import Foundation

struct ParadeKrewe: Codable, Identifiable {
    var id: Int 
    var objectid: Int
    var paradeName: String
    var location: String
    var day: String
    var date: String
    var time: String
    var formation: String
    var disband: String
    var geom: String
    var shapeSTLength: Float
    var numFloats: Int
}
