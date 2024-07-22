//
//  ContentView.swift
//  MardiGras
//
//  Created by Janice on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var parades = [ParadeKrewe]()
    
    var body: some View {
        NavigationStack {
            List(parades) { parade in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(parade.paradeName)")
                            .font(.largeHeadline)
                        Text("\(parade.location)")
                        Text("\(parade.date)")
                        Text("Starting: \(parade.time) CST")
                        Text("Formation: \(parade.formation)")
                        NavigationLink(destination: MapView()) {
                            Text("view route")
                        }
                    }
                    .font(.mediumHeadline)
                }
            }
            
            .task {
                await fetchJSON()
            }
            .navigationTitle("Mardi Gras Parades")
        }
    }
    
    init() {
        let appearance = UINavigationBarAppearance()
        let fontStyle: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "Karla-Regular_Bold", size: 20)!
        ]
        appearance.largeTitleTextAttributes = fontStyle
        appearance.titleTextAttributes = fontStyle
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    func fetchJSON() async {
        do {
            let url = URL(string:"https://run.mocky.io/v3/b3dfa8bd-b531-4f28-8646-4a5b2d1ce6ae")!
            let (data, response) = try await URLSession.shared.data(from: url)
            parades = try JSONDecoder().decode([ParadeKrewe].self, from: data)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ContentView()
}
