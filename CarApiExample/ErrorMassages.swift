//
//  ErrorMassages.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 29.09.2024.
//

import Foundation

enum ErrorMassages: String {
    case invalidUrl = "Eror in url"
    case unableToComplate = "Error in start url session"
    case invalidResponse = "Error in casting response to HTTPURLResponse"
    case invalidData = "Error in data"
    case failidDecode = "Failed to decode JSON"
}
