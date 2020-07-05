//
//  Order.swift
//  CupcakeIsGood
//
//  Created by Bagus on 5/7/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import Foundation
import SwiftUI

class Order: ObservableObject {
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false {
        // Add validation for when after the user toggle extraFrosting & addSprinkle but then decided to toggle Off the SpecialRequest, then these two parameters will be set back to false again (or Off)
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
