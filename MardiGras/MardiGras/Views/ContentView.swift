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
            .listStyle(.sidebar)
            .task {
                await fetchJSON()
            }
            .navigationTitle("Parades")
        }
    }
    
    init() {
        
        for name in UIFont.familyNames {
            print(name)
        }
        
//        let appearance = UINavigationBarAppearance()
//        let fontStyle: [NSAttributedString.Key: Any] = [
//            .font: UIFont(name: "Karla-Regular_Bold", size: 20)!
//        ]
//        appearance.largeTitleTextAttributes = fontStyle
//        appearance.titleTextAttributes = fontStyle
//        UINavigationBar.appearance().standardAppearance = appearance
//        UINavigationBar.appearance().compactAppearance = appearance
//        UINavigationBar.appearance().scrollEdgeAppearance = appearance
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
    ContentView()
}
