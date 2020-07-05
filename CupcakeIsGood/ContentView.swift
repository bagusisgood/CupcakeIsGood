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
                Text("Hello, there!")
                    .font(.largeTitle)
                Text("Commit from my personal mac.")
                    .font(.title)
                Text("Commit from my personal mac.")
                    .font(.headline)
                Text("Commit from my personal mac.")
                    .font(.subheadline)
                Text("Commit from my personal mac.")
                    .font(.footnote)
                Text("Commit from my personal mac.")
                    .font(.caption)
                Text("Commit from my personal mac.")
                    .font(.body)
                Text("Commit from my personal mac.")
                    .font(.callout)
            }
            .navigationBarTitle(Text("This has been hacked!"))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
