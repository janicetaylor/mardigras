//
//  PlacesView.swift
//  MardiGras
//
//  Created by Janice on 7/24/24.
//

import SwiftUI

struct PlacesView: View {
    
    @State private var places = [Place]()
    let prefixThumbnailUrl = "https://janicetaylor.app/mardigras/places-images/"
    
    var body: some View {
        NavigationStack {
            List(places) { place in
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: "\(prefixThumbnailUrl)\(place.thumbnailUrl)"),
                               content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                               placeholder: { ProgressView() })
                    Text("\(place.title)")
                        .font(.paradeLargeHeadline)
                        .foregroundStyle(.black)
                    Text("\(place.subtitle)")
                        .font(.paradeMediumHeadline)
                        .foregroundStyle(.gray)
                }
            }
            .navigationTitle("Places")
            .listStyle(.plain)
            .task {
                await loadJSON()
            }
        }
    }
    
    func loadJSON() async {
        do {
            let url = URL(string: "https://janicetaylor.app/mardigras/places.json")!
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
