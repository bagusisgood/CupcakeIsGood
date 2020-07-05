//
//  ContentView.swift
//  CupcakeIsGood
//
//  Created by Bagus Triyanto on 04/07/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var order = Order()
    
    var body: some View {
        NavigationView {
            Form {
                // Section ONE
                Section(header: Text("Order Details")) {
                    // Select cupcake type
                    Picker ("Select your cupcake", selection: $order.type) {
                        ForEach (0 ..< Order.types.count, id:\.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    // Select quantity
                    Stepper(value: $order.quantity, in: 3 ... 20) {
                        Text("Order quantity: \(order.quantity)")
                    }
                }
                
                // Section TWO
                Section(header: Text("Specialties")) {
                    Toggle(isOn: $order.specialRequestEnabled.animation()) {
                        Text("Any special request?")
                    }
                    
                    // Add conditional to show follow-up items
                    if order.specialRequestEnabled {
                        Toggle(isOn: $order.extraFrosting) {
                            Text("Extra frosting?")
                        }
                        
                        Toggle(isOn: $order.addSprinkles) {
                            Text("Add Sprinkles?")
                        }
                    }
                }
                
                // Section THREE
                Section(header: Text("Continue")) {
                    NavigationLink(destination: AddressView(order: order)) {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationBarTitle(Text("cupcakeIsGood"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
