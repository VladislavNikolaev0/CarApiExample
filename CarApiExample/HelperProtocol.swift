//
//  HelperProtocol.swift
//  CarApiExample
//
//  Created by Ангел предохранитель on 07.10.2024.
//

import Foundation

protocol Loopable {
    func allProperties() throws -> ([String],[Any])
}

extension Loopable {
    func allProperties() throws -> ([String],[Any]) {
        
        var result: ([String],[Any]) = ([],[])
        
        let mirror = Mirror(reflecting: self)
        
        guard let style = mirror.displayStyle, style == .struct else {
            throw NSError()
        }
        
        for (property, value) in mirror.children {
            guard let property = property else { continue }
            
            switch property {
            case "id":
                continue
            case "features":
                continue
            case "image":
                continue
            default:
                result.0.append(property)
                result.1.append(value)
            }
        }
        
        return result
    }
}
