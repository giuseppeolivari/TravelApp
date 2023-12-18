//
//  MapView.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//

import SwiftUI
import MapKit
import SwiftData

struct MapView: View {
    
    
   
    
    var body: some View {
        VStack{
            
            Map()
                //.navigationBarTitleDisplayMode(.inline)
        }.ignoresSafeArea()
        
    }
}

#Preview {
    MapView()
}



