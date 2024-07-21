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
                        Text("\(parade.Parade)")
                        Text("\(parade.Location)")
                    }
                    VStack(alignment: .leading) {
                        Text("Starting: \(parade.Time) CST")
                        Text("\(parade.FORMATION)")
                    }
                    
                }
            }
            .task {
                await fetchJSON()
            }
        }
    }
    
    func fetchJSON() async {
        do {
            let url = URL(string:"https://run.mocky.io/v3/d087871d-8bdd-4a9d-977e-0550018e9760")!
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
