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
                        Text("\(parade.location)")
                        Text("\(parade.formattedDate)")
                        Text("Starting: \(parade.time) CST")
                        Text("Formation: \(parade.formation)")
                    }
                }
            }
            .task {
                await fetchJSON()
            }
            .navigationTitle("Mardi Gras Parades")
        }
    }
    
    func fetchJSON() async {
        do {
            let url = URL(string:"https://run.mocky.io/v3/12a897ed-8f0d-459d-b740-2d98e44fbee6")!
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
