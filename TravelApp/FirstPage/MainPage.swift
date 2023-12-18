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
    @State var isPresented: Bool = false
    @Environment(\.modelContext) private var modelContext
    @Query private var viaggio: [Travel]

    
    @State private var index = 0
        let titles = ["My Travels", "I miei viaggi", "Mis viajes", "我的旅行", "Meine Reisen", "Gezilerim"]
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
    
    
    var body: some View {
        NavigationStack {
            
                
                List{
                    
                        Button(action: {
                            withAnimation {
                                isPresented.toggle()
                            }
                        }, label: {
                            ZStack {
                                Image("mappa")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(30)
                                    .frame(width: 350, height: 200)
                                    .shadow(radius: 10)
                                    .opacity(0.7)
                                    .accessibilityRemoveTraits(.isImage)
                                    .overlay(
                                        Image(systemName: "plus.circle")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                            .tint(.black)
                                            .padding([.top, .leading], 140)
                                            .padding(.leading, 140)
                                            .accessibilityRemoveTraits(.isImage)
                                    )
                            }
                            
                            .accessibilityLabel("tap to create a new travel")
                        }).listRowSeparator(.hidden)
                        .fullScreenCover(isPresented: $isPresented) {
                            NewTravel(isPresented: $isPresented)
                        }
                        
                        ForEach(viaggio) { peppe in
                            NavigationLink(destination: NoteList(travel: peppe)) {
                                VStack{
                                    Text(peppe.name + ":")
                                        .font(.largeTitle)
                                        .fontWeight(.bold)
                                    
                                    ZStack {
                                        if let imageData = peppe.photo,
                                           let uiImage = UIImage(data: imageData) {
                                            Image(uiImage: uiImage)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(maxWidth: 350, maxHeight: 200)
                                            //.opacity(0.8)
                                                .clipped()
                                                .cornerRadius(30)
                                                .shadow(radius: 10)
                                        } else {
                                            Image("mappa")
                                                .resizable()
                                                .cornerRadius(30)
                                                .frame(width: 350, height: 200)
                                        }
                                        
                                        Text(peppe.name)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .tint(.black)
                                            .background(Color.white.opacity(0.5))
                                            .padding([.bottom, .trailing], 130)
                                            .padding(.trailing, 90)
                                    }
                                }}.listRowSeparator(.hidden)
                        }.onDelete(perform: deleteItems)
                }
                .listRowSeparator(.hidden)
                .listStyle(.inset)
                
                
                .navigationTitle(titles[index])
                .transition(.opacity)
                //.animation(.easeInOut(duration: 2.0))
                .transition(.scale)
                
                .contentTransition(.opacity)
                .onReceive(timer) { _ in
                    withAnimation {
                        index = (index + 1) % titles.count
                    }
                }
            
                
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(viaggio[index])
            }
        }
    }
    
}

#Preview {
    
        MainPage()
    
}




/*
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
*/
 
 
 
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
