//
//  NewTravel.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//
import SwiftUI
import SwiftData
import PhotosUI

struct NewTravel: View {
 
    @Binding  var isPresented : Bool
    
    @State var travel = Travel(name: "")
    
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var calendar1 = false
    @State private var calendar2 = false
    @State private var selectedImageData: Data? = nil
    
    var numberOfDays: Int {
        return calculateDaysBetweenDates()
    }
    
    @State private var travelName = ""
    
    @State private var coverPhoto: PhotosPickerItem?
    
    private var selectedDates: [Date] {
        return saveDatesToArray()
    }
    
    
    
    @Environment(\.modelContext) private var modelContext
    
    //@Query private var 
    
    
    var body: some View {
        
        NavigationStack {
        
            ZStack {
                
                VStack {
                    
                    Text("Set location:")
                        .font(.title2)
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding([.top],50.0)
                    
                    TextField("Add Location", text: $travelName)
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                        .onChange(of: travelName) { oldValue, newValue in
                            travel.name = travelName
                        }
                    
                    HStack {
                        
                        Button(action: {withAnimation {calendar1.toggle()}}, label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 145, height: 95)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                VStack {
                                    Text("From")
                                        .fontWeight(.semibold)
                                        .accentColor(.black)
                                    
                                    Image(systemName: "calendar")
                                        .font(Font.custom("SF Pro", size: 45))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                        .frame(alignment: .center)
                                }
                            }
                        })
                        
                        Image(systemName: "arrow.forward")
                            .font(Font.custom("SF Pro", size: 45))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(alignment: .center)
                            .colorInvert()
                            .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Button(action: {withAnimation {calendar2.toggle()}}, label: {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 145, height: 95)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                VStack {
                                    Text("Until")
                                        .fontWeight(.semibold)
                                        .accentColor(.black)
                                    
                                    Image(systemName: "calendar")
                                        .font(Font.custom("SF Pro", size: 45))
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                        .frame(alignment: .center)
                                }
                            }
                        })
                    }
                    .padding()
                    
                    Text("Days: \(numberOfDays)")
                        .padding()
                    
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .shadow(radius: 10)
                    } else {
                        Image("mappa")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                            .shadow(radius: 10)
                            .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    }
                    
                    PhotosPicker(selection: $coverPhoto, matching: .images, photoLibrary: .shared()) {
                        Label("Add Image", systemImage: "camera")
                            
                            .accessibilityAddTraits([.isButton])
                            .accessibilityLabel("Choose your cover photo")
                            .accessibilityHint("Double tap to add a photo")
                    }
                    .onChange(of: coverPhoto) {
                        Task {
                            // Retrieve selected asset in the form of Data
                            if let data = try? await coverPhoto?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                    
                   
                    
                    Spacer()
                }
                
                if calendar1 {
                    calendarFromView(startDate: $startDate, calendar1: $calendar1)
                        .transition(.scale)
                        .zIndex(1.0)
                }
                
                if calendar2 {
                    calendarUntilView(endDate: $endDate, calendar2: $calendar2)
                        .transition(.scale)
                }
                
            }
            .navigationBarTitle("New Travel")
            
            .toolbar {
               
                
                /*
                NavigationLink(destination: NoteList(numberOfDays: numberOfDays, selectedDates: selectedDates, travelName: travelName, selectedImageData: selectedImageData)) {
                    Text("Next")
                }
             */
                
                Button("Done") {
                    let travel = Travel(name: " ")
                    travel.name = travelName
                    travel.daysNumber = numberOfDays
                    travel.dates  = selectedDates 
                    travel.photo = selectedImageData
                    
                    modelContext.insert(travel)
                    
                    isPresented.toggle()
                }
            }
            
        }
    }
    

    
    func calculateDaysBetweenDates() -> Int {
        // if end date is > then start fai questo
        if (endDate >= startDate) {
            
            
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
            let end = calendar.startOfDay(for: endDate)
            let components = calendar.dateComponents([.day], from: start, to: end)
            return components.day ?? 0
        }
        // altrimenti ritorna end date = startdate
        else {
            //let endDate = startDate
            return 0
        }
    }
    
    
    func saveDatesToArray() -> [Date] {
        var selectedDates: [Date] = []
        for index in 0..<numberOfDays {
            if let date = Calendar.current.date(byAdding: .day, value: index, to: startDate) {
                selectedDates.append(date)
            }
        }
        return selectedDates
    }
    
}

#Preview {
    NewTravel(isPresented: .constant(false))
}








