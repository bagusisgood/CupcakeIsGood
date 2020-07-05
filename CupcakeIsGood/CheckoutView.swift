//
//  CheckoutView.swift
//  CupcakeIsGood
//
//  Created by Bagus on 5/7/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order : Order
    
    var body: some View {
        VStack {
            Text("Checkout View")
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
