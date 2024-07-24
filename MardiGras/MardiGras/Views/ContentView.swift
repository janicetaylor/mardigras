//
//  ContentView.swift
//  MardiGras
//
//  Created by Janice on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            Text("first view")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Places")
                }
                .tag(1)
            ParadeView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Parades")
                }
                .tag(2)
            Text("third view")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Favorites")
                }
                .tag(3)
            Text("fourth view")
                .tabItem {
                    Image(systemName: "4.circle")
                    Text("Settings")
                }
                .tag(4)
        }
        
    }
    
}

#Preview {
    ContentView()
}
