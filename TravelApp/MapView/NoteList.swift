//
//  NoteList.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 12/12/23.
//

import SwiftUI

struct NoteList: View {
    var body: some View {
        VStack {
            // Header with a picture
            Image("Header")
                .resizable()
                              .scaledToFill()
                              .frame(maxWidth: .infinity, maxHeight: 200)
                              .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                              .edgesIgnoringSafeArea(.top)
                              .clipped()
                              .cornerRadius(15)
            
            
            

            // List of clickable dates
            List {
                ForEach(1..<18) { index in
                    // Replace "Your Date" with the actual date information
                    NavigationLink(destination: Text("Details for Date \(index)")) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Your Date \(index)")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("Additional information or details for date \(index)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding(10)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(color: Color.gray.opacity(0.4), radius: 4, x: 0, y: 2)
                    }
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList()
    }
}


//ALI YOU ARE BEAUTIFUL
