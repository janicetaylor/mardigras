//
//  MapView.swift
//  MardiGras
//
//  Created by Janice on 7/21/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let annotations = [
        Annotation(coordinate: CLLocationCoordinate2D(latitude: -90.101794232157, longitude: 29.925036114715), anchor: UnitPoint(x: 0, y: 0))
        
    
        
    ]
    
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
