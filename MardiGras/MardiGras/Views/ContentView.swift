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
            PlacesView()
                .tabItem {
                    Image(systemName: "flag.fill")
                    Text("Places")
                }
                .tag(1)
            ParadeView()
                .tabItem {
                    Image(systemName: "location.circle.fill")
                    Text("Parades")
                }
                .tag(2)
            Text("third view")
                .tabItem {
                    Image(systemName: "star.circle.fill")
                    Text("Favorites")
                }
                .tag(3)
            Text("fourth view")
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Settings")
                }
                .tag(4)
        }
        
    }
    
}

#Preview {
    ContentView()
}
