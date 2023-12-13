//
//  NoteList.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 12/12/23.
//

// NoteList.swift
// NoteList.swift
// NoteList.swift
// NoteList.swift
import SwiftUI

struct NoteList: View {
    let numberOfDays: Int
    let selectedDates: [Date]
    let travelName: String

    var body: some View {
        VStack {
            HStack {
                       /* Image(systemName: "airplane")
                           .resizable()
                           .frame(width: 20, height:20)
                           .foregroundColor(.blue)
*/
                       Text(travelName)
                           .font(.title)
                           .fontWeight(.bold)
                           //.foregroundColor(.blue)
                   }
            // Header with a picture
            Image("Header")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 180)
                .opacity(0.9)
                .clipped()
                .cornerRadius(20)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)

            // List of clickable dates
            List {
                ForEach(selectedDates, id: \.self) { date in
                    NavigationLink(destination: Text("Details for \(formattedDate(date))")) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(" \(formattedDate(date))")
                                .font(.headline)
                                .foregroundColor(.primary)
                            Text("Additional information or details for \(formattedDate(date))")
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
        .navigationBarTitle("") // Clear the default navigation bar title
    }

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList(numberOfDays: 5, selectedDates: [Date(), Date(), Date(), Date(), Date()], travelName: "Sample Travel")
    }
}



//ALI YOU ARE BEAUTIFUL
