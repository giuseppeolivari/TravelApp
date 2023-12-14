//
//  MapView.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map()
            .navigationBarTitleDisplayMode(.inline)
            
    }
}

#Preview {
    MapView()
}
