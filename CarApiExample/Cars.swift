//
//  Cars.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 26.09.2024.
//

import Foundation

struct Cars: Codable {
    var city_mpg: Int
    var `class`: String
    var combination_mpg: Int
    var cylinders: Int
    var displacement: Float
    var drive: String
    var fuel_type: String
    var highway_mpg: Int
    var make: String
    var model: String
    var transmission: String
    var year: Int
}
