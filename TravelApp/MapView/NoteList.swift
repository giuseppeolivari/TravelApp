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
import SwiftData

struct NoteList: View {
    let travel: Travel
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack {
            Text(travel.name)
                .font(.title)
                .fontWeight(.bold)

            if let imageData = travel.photo,
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
                Image("Header")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 180)
                    .opacity(0.9)
                    .clipped()
                    .cornerRadius(20)
                    .shadow(radius: 10)
            }

            List {
                ForEach(travel.dates ?? [], id: \.self) { date in
                    NavigationLink(destination: AddNoteView(selectedDate: formattedDate(date))) {
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
        .navigationBarTitle("")
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
        NoteList(travel: Travel(name: "Sample Travel"))
    }
}

//ALI YOU ARE BEAUTIFUL


/*
 struct NoteList_Previews: PreviewProvider {
     static var previews: some View {
         NoteList(numberOfDays: 5, selectedDates: [Date(), Date(), Date(), Date(), Date()], travelName: "Sample Travel", selectedImageData: nil)
     }
 }

 */
