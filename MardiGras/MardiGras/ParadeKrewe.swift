//
//  Parade.swift
//  MardiGras
//
//  Created by Janice on 7/21/24.
//

import Foundation

struct ParadeKrewe: Codable, Identifiable {
    var id: Int 
    var OBJECTID: Int
    var Parade: String
    var Location: String
    var Day: String
    var Date: String
    var Time: String
    var FORMATION: String
    var DISBAND: String
    var NumFloats: Int
}
