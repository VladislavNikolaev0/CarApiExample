//
//  Cars.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 26.09.2024.
//

import Foundation

struct Cars: Codable {
    var id: Int
    var make: String
    var model: String
    var year: Int
    var color: String
    var mileage: Int
    var price: Int
    var fuelType: String
    var transmission: String
    var engine: String
    var horsepower: Int
    var features: [String]
    var owners: Int
    var image: String
}
