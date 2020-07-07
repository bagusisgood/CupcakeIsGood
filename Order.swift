//
//  Order.swift
//  CupcakeIsGood
//
//  Created by Bagus on 5/7/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import Foundation
import SwiftUI

class Order: ObservableObject, Codable {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    // Order Details
    @Published var type = 0
    @Published var quantity = 3
    
    // Special Order Requests
    @Published var specialRequestEnabled = false {
        // Add validation for when after the user toggle extraFrosting & addSprinkle but then decided to toggle Off the SpecialRequest, then these two parameters will be set back to false again (or Off)
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    // Special Options
    @Published var extraFrosting = false
    @Published var addSprinkles = false
    
    // Address Details
    @Published var name = ""
    @Published var streetAddress = ""
    @Published var city = ""
    @Published var zip = ""
    
    // Address Validation: Simple validation of not allowing empt value
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
    
    // Calculate pricing
    var cost: Double {
        var cost = Double(quantity) * 2 // $2 per cupcake
        cost += (Double(type) / 2) // More complex cake (the higher index number in the list) will cost more
        
        // extra frosting
        if extraFrosting {
            cost += Double(quantity)
        }
        
        // add sprinkes
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        // return back the cost
        return cost
    }
    
    // Adding Codable conformance manually (@Published wrapper)
    enum CodingKeys: CodingKey {
        case type, quantity, extraFrosting, addSprinkles, name, streetAddress, city, zip
    }
    
    // Encoding (Our Data -> JSON)
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(type, forKey: .type)
        try container.encode(quantity, forKey: .quantity)
        
        try container.encode(extraFrosting, forKey: .extraFrosting)
        try container.encode(addSprinkles, forKey: .addSprinkles)
        
        try container.encode(name, forKey: .name)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(city, forKey: .city)
        try container.encode(zip, forKey: .zip)
        
    }
    
    // Decoding (JSON -> Our Data)
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        type = try container.decode(Int.self, forKey: .type)
        quantity = try container.decode(Int.self, forKey: .quantity)
        
        extraFrosting = try container.decode(Bool.self, forKey: .extraFrosting)
        addSprinkles = try container.decode(Bool.self, forKey: .addSprinkles)
        
        name = try container.decode(String.self, forKey: .name)
        streetAddress = try container.decode(String.self, forKey: .streetAddress)
        city = try container.decode(String.self, forKey: .city)
        zip = try container.decode(String.self, forKey: .zip)
    }
    
    // Create another init (Class = multiple init), so that we can create Order() without any data -> will use default value
    init() {
        // empty -- use default value
    }
    
}
