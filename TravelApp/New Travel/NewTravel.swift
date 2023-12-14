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
    
    @State  var startDate = Date()
    @State  var endDate = Date()
    @State  var calendar1 = false
    @State  var calendar2 = false
    @State private var selectedImageData: Data? = nil
    
    var numberOfDays : Int {
        return calculateDaysBetweenDates()
    }
    @State  var travelName = ""
    
    
    @State var coverPhoto : PhotosPickerItem?
    
    
    
    
    private var selectedDates: [Date] {
        return saveDatesToArray()
    }
    
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                /*
                 if calendar1{
                 calendarFromView(startDate: $startDate, calendar1: $calendar1)
                 }
                 
                 
                 if calendar2{
                 calendarUntilView(endDate: $endDate, calendar2: $calendar2)
                 }
                 */
                
                VStack() {
                    
                    Text("Set location:")
                        .font(.title2)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .lineLimit(nil)
                        .padding([.top],50.0)
                        
                        
                
                
            
                    
                    TextField("Add Location", text: $travelName)
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                        
                    
                    
                    
                    
                    
                    
                    HStack{
                        
                        
                        Button(action: {withAnimation {calendar1.toggle()}}, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 145, height: 95)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                VStack{
                                    Text("From")
                                        .fontWeight(.semibold)
                                        .accentColor(.black)
                                    
                                    
                                    Image(systemName: "calendar").font(
                                        Font.custom("SF Pro", size: 45)
                                        
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(alignment: .center)
                                }
                            }
                        })
                        
                        
                        Image(systemName: "arrow.forward").font(
                            Font.custom("SF Pro", size: 45)
                            
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(alignment: .center)
                        
                        
                        Button(action: {withAnimation {calendar2.toggle()}}, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 145, height: 95)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                VStack{
                                    Text("Until")
                                        .fontWeight(.semibold)
                                        .accentColor(.black)
                                    
                                    
                                    Image(systemName: "calendar").font(
                                        Font.custom("SF Pro", size: 45)
                                        
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(alignment: .center)
                                }
                            }
                        })
                    }.padding()
                        
                    
                    Text("Days: \(numberOfDays)")
                        .padding()
                    
                   /*
                    Button(action: {
                        calculateDaysBetweenDates()
                        saveDatesToArray()
                    }, label: {
                        Text("Button")
                    })
                    
                    */
                    
                    
                    
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        //.scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        //.frame(maxWidth: .infinity, maxHeight: 180)
                        //.clipped()
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    else{
                        Image("mappa")
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                        //.scaledToFill()
                            .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        //.frame(maxWidth: .infinity, maxHeight: 180)
                        //.clipped()
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                        
                        
                    PhotosPicker(selection: $coverPhoto, matching: .images, photoLibrary: .shared()) {
                        Label("Add Image", systemImage : "camera")
                            .accessibilityAddTraits([.isButton])
                            .accessibilityLabel("Choose your cover photo")
                            .accessibilityHint("Double tap to add a photo")
                        
                    }.onChange(of: coverPhoto) { newItem in
                        Task {
                            // Retrive selected asset in the form of Data
                            if let data = try? await newItem?.loadTransferable(type: Data.self) {
                                selectedImageData = data
                            }
                        }
                    }
                    
                   
                        
                    
                    
                    Spacer()
                    
                    /*
                     Group{
                     //Text("data iniziale")
                     DatePicker("From", selection: $startDate, displayedComponents: .date)
                     //.datePickerStyle(WheelDatePickerStyle())
                     .padding()
                     
                     //Text("finale")
                     DatePicker("To", selection: $endDate, displayedComponents: .date)
                     //.datePickerStyle(GraphicalDatePickerStyle())
                     .padding()
                     
                     Text("Days: \(calculateDaysBetweenDates())")
                     .padding()
                     
                     
                     func calculateDaysBetweenDates() -> Int {
                     let calendar = Calendar.current
                     let start = calendar.startOfDay(for: startDate)
                     let end = calendar.startOfDay(for: endDate)
                     let components = calendar.dateComponents([.day], from: start, to: end)
                     return components.day ?? 0
                     }
                     
                     }
                     */
                }
                
                if calendar1{
                    calendarFromView(startDate: $startDate, calendar1: $calendar1).transition(.scale)
                        .zIndex(1.0)
                }
                
                
                
                if calendar2{
                    calendarUntilView(endDate: $endDate, calendar2: $calendar2).transition(.scale)
                }
                
                
            }.navigationBarTitle("New Travel")
                .toolbar {
                    NavigationLink(destination: NoteList(numberOfDays: numberOfDays, selectedDates: selectedDates, travelName: travelName, selectedImageData: selectedImageData )) {
                                 Text("Next")
                    }
                }
            
        }
    }
    
    
    
    func calculateDaysBetweenDates() -> Int {
        print(startDate.debugDescription)
        print(endDate.debugDescription)
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
        print(start.debugDescription)
            let end = calendar.startOfDay(for: endDate)
        print(end.debugDescription)
            let components = calendar.dateComponents([.day], from: start, to: end)
            
        return components.day ?? 0
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
    NewTravel()
}























/*
//
//  NewTravel.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//

import SwiftUI


struct NewTravel: View {
    
    @State  var startDate = Date()
    @State  var endDate = Date()
    @State  var calendar1 = false
    @State  var calendar2 = false
    var numberOfDays : Int {
        return calculateDaysBetweenDates()
    }
    @State  var travelName = ""
    //@State var totalDays = 0
    
    
    private var selectedDates: [Date] {
        return saveDatesToArray()
    }
    
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                /*
                 if calendar1{
                 calendarFromView(startDate: $startDate, calendar1: $calendar1)
                 }
                 
                 
                 if calendar2{
                 calendarUntilView(endDate: $endDate, calendar2: $calendar2)
                 }
                 */
                
                VStack() {
                    
                    Text("Set location")
                        .font(.title2)
                        .padding()
                        .padding([ .leading], -195.0)
                    
                    
                    TextField("Add Location", text: $travelName)
                        .padding()
                        .font(.title)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                        
                    
                    
                    
                    
                    
                    
                    HStack{
                        
                        
                        Button(action: {withAnimation {calendar1.toggle()}}, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 145, height: 95)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                VStack{
                                    Text("From")
                                        .fontWeight(.semibold)
                                        .accentColor(.black)
                                    
                                    
                                    Image(systemName: "calendar").font(
                                        Font.custom("SF Pro", size: 45)
                                        
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(alignment: .center)
                                }
                            }
                        })
                        
                        
                        Image(systemName: "arrow.forward").font(
                            Font.custom("SF Pro", size: 45)
                            
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .frame(alignment: .center)
                        
                        
                        Button(action: {withAnimation {calendar2.toggle()}}, label: {
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(width: 145, height: 95)
                                    .background(Color.gray)
                                    .cornerRadius(20)
                                VStack{
                                    Text("Until")
                                        .fontWeight(.semibold)
                                        .accentColor(.black)
                                    
                                    
                                    Image(systemName: "calendar").font(
                                        Font.custom("SF Pro", size: 45)
                                        
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(alignment: .center)
                                }
                            }
                        })
                    }.padding()
                        
                    
                    Text("Days: \(numberOfDays)")
                        .padding()
                    
                   /*
                    Button(action: {
                        calculateDaysBetweenDates()
                        saveDatesToArray()
                    }, label: {
                        Text("Button")
                    })
                    
                    */
                    
                    
                    
                    
                    
                    
                    
                    Spacer()
                    
                    /*
                     Group{
                     //Text("data iniziale")
                     DatePicker("From", selection: $startDate, displayedComponents: .date)
                     //.datePickerStyle(WheelDatePickerStyle())
                     .padding()
                     
                     //Text("finale")
                     DatePicker("To", selection: $endDate, displayedComponents: .date)
                     //.datePickerStyle(GraphicalDatePickerStyle())
                     .padding()
                     
                     Text("Days: \(calculateDaysBetweenDates())")
                     .padding()
                     
                     
                     func calculateDaysBetweenDates() -> Int {
                     let calendar = Calendar.current
                     let start = calendar.startOfDay(for: startDate)
                     let end = calendar.startOfDay(for: endDate)
                     let components = calendar.dateComponents([.day], from: start, to: end)
                     return components.day ?? 0
                     }
                     
                     }
                     */
                }
                
                if calendar1{
                    calendarFromView(startDate: $startDate, calendar1: $calendar1).transition(.scale)
                        .zIndex(1.0)
                }
                
                
                
                if calendar2{
                    calendarUntilView(endDate: $endDate, calendar2: $calendar2).transition(.scale)
                }
                
                
            }.navigationBarTitle("New Travel")
                .toolbar {
                    NavigationLink(destination: NoteList(numberOfDays: numberOfDays, selectedDates: selectedDates, travelName: travelName)) {
                                 Text("Next")
                    }
                }
            
        }
    }
    
    
    
    func calculateDaysBetweenDates() -> Int {
        print(startDate.debugDescription)
        print(endDate.debugDescription)
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
        print(start.debugDescription)
            let end = calendar.startOfDay(for: endDate)
        print(end.debugDescription)
            let components = calendar.dateComponents([.day], from: start, to: end)
            
        return components.day ?? 0
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
    NewTravel()
}


*/
