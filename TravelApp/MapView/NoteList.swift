//
//  NoteList.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 12/12/23.
//

// NoteList.swift
// NoteList.swift
import SwiftUI

struct NoteList: View {
    let numberOfDays: Int
    let selectedDates: [Date]

    var body: some View {
        VStack {
            // Header with a picture
            Image("Header")
                .resizable()
                         .scaledToFill()
                         .frame(maxWidth: .infinity, maxHeight: 300)

                         .opacity(0.8)
                         .clipped()
                         .cornerRadius(30)

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
                           /* Text("Number of Days: \(numberOfDays)")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            */
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

    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}

struct NoteList_Previews: PreviewProvider {
    static var previews: some View {
        NoteList(numberOfDays: 5, selectedDates: [Date(), Date(), Date(), Date(), Date()])
    }
}




//ALI YOU ARE BEAUTIFUL
