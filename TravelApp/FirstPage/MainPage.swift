//
//  MainPage.swift
//  TravelApp
//
//  Created by Adriano Prota on 11/12/23.
//

import SwiftUI
import UIKit
import SwiftData

struct MainPage: View {
    let data: [String] = []
    @State var image1 = "mappa"
    //@State var bool : Bool = true
    
    @State var isPresented : Bool = false

    @Environment(\.modelContext) private var modelContext
    
    @Query private var viaggio: [Travel]
    
    
    var body: some View{
        
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 10)], content: {
                    
                    
                    Button(action: {withAnimation {isPresented.toggle()}}, label: {
                        ZStack {
                            Image("mappa")
                                .resizable()
                                .cornerRadius(30)
                                .frame(width: 350, height: 200)
                                .opacity(0.8)
                                .overlay(
                                    Image(systemName: "plus.circle")
                                        .resizable()
                                        //.opacity(0.8)
                                        .frame(width: 40, height: 40)
                                        .tint(.black)
                                        .padding([.top, .leading],140)
                                        .padding(.leading,160)
                                )                        }
                    }).fullScreenCover(isPresented: $isPresented) {
                        
                        NewTravel(isPresented: $isPresented)
                        //non mapview ma NewTravel
                            
                    }
                    
                    
                    
                    ForEach(viaggio){ peppe in
                        NavigationLink(destination: NewTravel(isPresented: $isPresented), label:{
                            ZStack{
                                if let imageData = peppe.photo ,
                                   let uiImage = UIImage(data: imageData) {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(maxWidth: .infinity, maxHeight: 180)
                                        .opacity(0.9)
                                        .clipped()
                                        .cornerRadius(20)
                                        .shadow(radius: 10)
                                } else {
                                    Image("mappa")
                                        .resizable()
                                        .cornerRadius(30)
                                        .frame(width: 350, height: 200)
                                        //.opacity(0.8)
                                }
                                /*
                                Image("mappa")
                                    .resizable()
                                    .cornerRadius(30)
                                    .frame(width: 350, height: 200)
                                    //.opacity(0.8)
                                    */
                                
                                Text(peppe.name)
                                    .font(.largeTitle)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .tint(.black)
                                    .background(.white.opacity(0.5))
                                    .padding([.bottom,.trailing],130)
                                    .padding(.trailing,90)
                            }})
                        
                    }
                    
                }).navigationTitle("TravelApp")
                        
                        
                    }
                    
                }
            }
            
    
   
    
    
    
        }
    
    
    
    
    
    
    
    
    
    
    
    
    


#Preview {
    NavigationStack{
        MainPage()
    }
}

/*
 Secchio dell'immondizia di adriano
 
 1.
//                                Image(image1)
//                                    .resizable()
//                                    .opacity(0.7) //0.4
//                                    .cornerRadius(20)
//                                    .frame(width: 350, height: 200)
//                                    .padding()
//                                    .overlay(
//                                        Image(systemName: "plus.circle")
//                                            .resizable()
//                                            .opacity(0.6)
//                                            .frame(width: 60, height: 60)
//                                            .tint(.black)
 
 2.
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
*/
