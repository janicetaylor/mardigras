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
               
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: "\(parade.thumbnail)"),
                                    content: { image in
                                        image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        },
                                        placeholder: { ProgressView() })
                            Text("\(parade.paradeName)")
                                .font(.paradeLargeHeadline)
                                .foregroundStyle(.black)
                            Text("\(parade.location)")
                                .font(.paradeMediumHeadline)
                                .foregroundStyle(.gray)
                            Text("\(parade.paradeDate)")
                                .font(.paradeMediumHeadline)
                                .foregroundStyle(.gray)
                            
                        NavigationLink(destination: MapView()) { Text("view more") }
                        
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
            let url = URL(string:"https://run.mocky.io/v3/4989e57c-ebc3-4888-9e08-daf1ff40e5ba")!
            let (data, response) = try await URLSession.shared.data(from: url)
            parades = try JSONDecoder().decode([ParadeKrewe].self, from: data)
            print(parades.count)
        } catch {
            print(error)
        }
    }
}

#Preview {
    ParadeView()
}
