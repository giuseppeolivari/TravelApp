//
//  MainPage.swift
//  TravelApp
//
//  Created by Adriano Prota on 11/12/23.
//

import SwiftUI
import UIKit

struct MainPage: View {
    let data = (0...1).map {"Pezzi\($0)"}
    let image1 = "mappa"
    var bool : Bool = true
    
    
    var body: some View{
        
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: [/*GridItem(spacing: 10),*/GridItem(.flexible(), spacing: 10)], content: {
                    ForEach(data, id: \.self){pezzo in
                        if bool {
                            NavigationLink(destination: NewTravel(), label:{
                                
                                Image(image1)
                                    .resizable()
                                    .opacity(0.7) //0.4
                                    .cornerRadius(20)
                                    .frame(width: 350, height: 200)
                                    .padding()
                                    .overlay(
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .opacity(0.6)
                                            .frame(width: 60, height: 60)
                                            .tint(.black)
                                        
                                    )})
                        } else{
                            Text("CIAO")
                        }
                        
                    }
                    
                }).navigationTitle("Hello").toolbar(){
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: MapView(), label: {Image(systemName: "map")
                            .tint(.red)} )
                        
                        
                    }
                    
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

#Preview {
    NavigationStack{
        MainPage()
    }
}
