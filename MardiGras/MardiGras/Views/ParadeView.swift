//
//  ParadeView.swift
//  MardiGras
//
//  Created by Janice on 7/23/24.
//

import SwiftUI

struct ParadeView: View {
    
    @State private var parades = [Parade]()
    let prefixThumbnailUrl = "https://janicetaylor.app/mardigras/parade-images/"

    var body: some View {
        NavigationStack {
            List(parades) { parade in
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: "\(prefixThumbnailUrl)\(parade.thumbnail)"),
                            content: { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                            },
                            placeholder: { ProgressView() })
                        Text("\(parade.paradeName)")
                            .font(.paradeLargeHeadline)
                            .foregroundStyle(.black)
                        Text("\(parade.location), \(parade.formation)")
                            .font(.paradeMediumHeadline)
                            .foregroundStyle(.gray)
                        Text("\(parade.paradeDate) \(parade.time)")
                            .font(.paradeSmallHeadline)
                            .foregroundStyle(.gray)
                        NavigationLink(destination: MapView()) { Text("details") }
                    }
            }
            .navigationTitle("Parades")
            .listStyle(.plain)
            .task {
                await fetchJSON()
            }
        }
    }
    
    func fetchJSON() async {
        do {
            let url = URL(string:"https://janicetaylor.app/mardigras/parades.json")!
            let (data, response) = try await URLSession.shared.data(from: url)
            parades = try JSONDecoder().decode([Parade].self, from: data)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ParadeView()
}
