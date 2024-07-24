//
//  PlacesView.swift
//  MardiGras
//
//  Created by Janice on 7/24/24.
//

import SwiftUI

struct PlacesView: View {
    
    @State private var places = [Place]()
    
    var body: some View {
        List(places) { place in
            Text("\(place.title)")
        }
        .task {
            await loadJSON()
        }
    }
    
    func loadJSON() async {
        do {
            let url = URL(string: "https://run.mocky.io/v3/21392f4b-bdba-4894-88e9-9c7984c9c782")!
            let (data, response) = try await URLSession.shared.data(from: url)
            places = try JSONDecoder().decode([Place].self, from: data)
        } catch {
            print(error)
        }
       
    }
}

#Preview {
    PlacesView()
}
