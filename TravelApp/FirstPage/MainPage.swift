//
//  MainPage.swift
//  TravelApp
//
//  Created by Adriano Prota on 11/12/23.
//

import SwiftUI
import UIKit

struct MainPage: View {
var body: some View{
        
        
        
        NavigationView{
            VStack {
                
                
                
                
                
            }.navigationTitle("Hello").toolbar(){
                ToolbarItem(placement: .topBarTrailing) {
                    
                    Button{
                        //
                    }label: {
                        Image(systemName: "globe")
                            .tint(.red)
                    }
                    
                }
                
            }
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
   
    
    
    
}

#Preview {
    MainPage()
}

