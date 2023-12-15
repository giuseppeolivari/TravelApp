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
    
    //@Binding  var isPresented : Bool
    
   
    
    var body: some View {
        VStack{
            /*
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                isPresented.toggle()
            }
             */
            Map()
                //.navigationBarTitleDisplayMode(.inline)
        }.ignoresSafeArea()
        
    }
}

#Preview {
    MapView()
}


//togliere la parte del toggle che ho fatto per prova
