//
//  MainPage.swift
//  TravelApp
//
//  Created by Adriano Prota on 11/12/23.
//

import SwiftUI
import UIKit

struct MainPage: View {
    let data = (1...100).map {"Pezzi\($0)"}
    

    var body: some View{
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: [GridItem(.fixed(100)),GridItem()], content: {
                    ForEach(data, id: \.self){pezzo in
                      Image("mappa")
                            .opacity(1) //0.4
                            .cornerRadius(230)
                        
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }).navigationTitle("Hello").toolbar(){
                    ToolbarItem(placement: .topBarTrailing) {
                        
                        Button{
                            //
                        }label: {
                            Image(systemName: "map")
                                .tint(.red)
                        }
                        
                    }
                    
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

#Preview {
    MainPage()
}

