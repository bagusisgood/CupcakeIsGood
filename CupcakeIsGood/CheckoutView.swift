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
    
    @State private var confirmationTitle = ""
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    
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
                        self.placeOrder()
                        
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
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text(confirmationTitle), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }
        
    }
    
    func placeOrder() {
        // STEP ONE: Convert Order Object to JSON to be sent as request
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        // STEP TWO: Prepare URLRequest to send our Encoded JSON data
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded
        
        // STEP THREE: Run the request & process the response
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error").")
                return
            }
            
            if let decodedOrder = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationTitle = "Thank You!"
                self.confirmationMessage = "Your order for \(decodedOrder.quantity)x \(Order.types[decodedOrder.type].lowercased()) cupcakes\nis on its way!"
                self.showingConfirmation = true
            } else {
                self.confirmationTitle = "We're Sorry!"
                self.confirmationMessage = "Invalid response from server. Try again."
                self.showingConfirmation = true
            }
            
        }.resume()
        
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
