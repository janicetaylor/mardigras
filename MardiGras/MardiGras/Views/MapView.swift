//
//  MapView.swift
//  MardiGras
//
//  Created by Janice on 7/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 29.951065, longitude: -90.071533),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )
    )
    
    var body: some View {
        Map(initialPosition: startPosition)
    }
}

#Preview {
    MapView()
}
