//
//  ParadeView.swift
//  MardiGras
//
//  Created by Janice on 7/23/24.
//

import SwiftUI

struct ParadeView: View {
    
    @State private var parades = [ParadeKrewe]()

    var body: some View {
        NavigationStack {
            List(parades) { parade in
                HStack {
                    Image("parade1")
                    VStack(alignment: .leading) {
                        Text("\(parade.paradeName)")
                            .font(.paradeLargeHeadline)
                            .foregroundStyle(.black)
                        Text("\(parade.location)")
                            .font(.paradeMediumHeadline)
                            .foregroundStyle(.gray)
                    }
                    NavigationLink(destination: MapView()) { }
                }
            }
            .listStyle(.plain)
            .task {
                await fetchJSON()
            }
        }
    }
    
    func fetchJSON() async {
        do {
            let url = URL(string:"https://run.mocky.io/v3/92d051ce-c3c7-44aa-8595-275e49b2e13a")!
            let (data, response) = try await URLSession.shared.data(from: url)
            parades = try JSONDecoder().decode([ParadeKrewe].self, from: data)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ParadeView()
}
