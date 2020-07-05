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
        GeometryReader { geo in

                VStack (spacing: 20) {
                    Spacer()
                    
                    Image("cupcakes")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width * 0.9)
                        .cornerRadius(12)
                    
                    Text("Total order price: $\(self.order.cost, specifier: "%.2f")")
                        .font(.title)
                    
                    Spacer()
                    
                    Button(action: {
                        // later in Day 51
                    }) {
                        Text("Place Order")
                            .font(.headline)
                            .frame(width: geo.size.width * 0.9, height: 50)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                    }
                
                
            }
            .padding()
        }
        .navigationBarTitle("Checkout", displayMode: .inline)
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
