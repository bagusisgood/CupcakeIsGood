//
//  ContentView.swift
//  CupcakeIsGood
//
//  Created by Bagus Triyanto on 04/07/20.
//  Copyright © 2020 Bagus Triyanto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Cupcake is good, right?")
                    .font(.largeTitle)
            }
            .navigationBarTitle(Text("CupcakeIsGood"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
