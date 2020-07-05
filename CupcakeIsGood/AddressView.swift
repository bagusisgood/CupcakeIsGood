//
//  AddressView.swift
//  CupcakeIsGood
//
//  Created by Bagus on 5/7/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order : Order
    
    var body: some View {
        Form {
            // Section ONE
            Section (header: Text("Input Address")){
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("ZIP Code", text: $order.zip)
            }
                
            // Section TWO
            Section (header: Text("Complete Order")) {
                NavigationLink(destination: CheckoutView(order: order)) {
                    Text("Check Out")
                }
            }
                // Validate adress for Checking out
                .disabled(order.hasValidAddress == false)
                
        }
        .navigationBarTitle("Delivery Details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
