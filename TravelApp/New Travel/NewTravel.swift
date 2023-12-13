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
    @State  var numberOfDays : Int = 0
    @State  var travelName = ""
    
    
    @State private var selectedDates: [Date] = []
    
    
    
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
                        .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                        .padding()
                        .padding([ .leading], -195.0)
                        
                        
                    TextField("Add Location", text: $travelName)
                        .padding()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.words)
                        
                        
                        
                        
                
                    
                    HStack{
                        
                        
                        Button(action: {calendar1.toggle()}, label: {
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
                        
                        
                        Button(action: {calendar2.toggle()}, label: {
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
                    
                    
                    Button(action: {
                        calculateDaysBetweenDates()
                        saveDatesToArray()
                    }, label: {
                        Text("Button")
                    })
                    
                    
                   
                    
                    
                   
                    
                    
                    
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
                    calendarFromView(startDate: $startDate, calendar1: $calendar1).transition(.move(edge: .bottom))
                        .zIndex(1.0)
                }
                    
                
                
                if calendar2{
                    calendarUntilView(endDate: $endDate, calendar2: $calendar2)
                }
                
                
            }.navigationBarTitle("New Travel")
                .toolbar {
                    NavigationLink(destination: NoteList(numberOfDays: numberOfDays, selectedDates: selectedDates)) {
                        Text("Next")
                    }
                }
            
        }
    }
    
    
    
    func calculateDaysBetweenDates() -> Void {
        print(startDate.debugDescription)
        print(endDate.debugDescription)
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
        print(start.debugDescription)
            let end = calendar.startOfDay(for: endDate)
        print(end.debugDescription)
            let components = calendar.dateComponents([.day], from: start, to: end)
            numberOfDays = components.day ?? 0
        }
    
    
    func saveDatesToArray() {
        selectedDates = []
        for index in 0..<numberOfDays {
            if let date = Calendar.current.date(byAdding: .day, value: index, to: startDate) {
                selectedDates.append(date)
            }
        }
    }
    
    
    
}
    


#Preview {
    NewTravel()
}






//
//  NewTravel.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//

/*
import SwiftUI

struct NewTravel: View {
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var calendar1 = false
    @State private var calendar2 = false
    @State private var numberOfDays: Int = 0
    @State private var selectedDates: [Date] = []

    var body: some View {
        NavigationView {
            ZStack {
                
                if calendar1 {
                    // Assuming you have the functions calendarFromView and calendarUntilView defined
                    calendarFromView(startDate: $startDate, calendar1: $calendar1)
                }

                if calendar2 {
                    // Assuming you have the function calendarUntilView defined
                    calendarUntilView(endDate: $endDate, calendar2: $calendar2)
                }

                VStack {
                    HStack {
                        Button(action: {
                            calendar1.toggle()
                        }) {
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
                        }

                        Image(systemName: "arrow.forward")
                            .font(Font.custom("SF Pro", size: 45))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(alignment: .center)

                        Button(action: {
                            calendar2.toggle()
                        }) {
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
                        }
                    }

                    Text("Days: \(numberOfDays)")
                        .padding()

                    Button(action: {
                        calculateDaysBetweenDates()
                        saveDatesToArray()
                    }) {
                        Text("Button")
                    }

                    NavigationLink(destination: NoteList(numberOfDays: numberOfDays, selectedDates: selectedDates)) {
                        Text("Go to NoteList")
                    }

                    Spacer()
                }
            }
            .navigationBarTitle("New Travel")
        }
    }

    func calculateDaysBetweenDates() {
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: startDate)
        let end = calendar.startOfDay(for: endDate)
        let components = calendar.dateComponents([.day], from: start, to: end)
        numberOfDays = components.day ?? 0
    }

    func saveDatesToArray() {
        selectedDates = []
        for index in 0..<numberOfDays {
            if let date = Calendar.current.date(byAdding: .day, value: index, to: startDate) {
                selectedDates.append(date)
            }
        }
    }
}

struct NewTravel_Previews: PreviewProvider {
    static var previews: some View {
        NewTravel()
    }
}
*/






















//
//  NewTravel.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//



/*


import SwiftUI
import MapKit

struct NewTravel: View {
    
    @State  var startDate = Date()
    @State  var endDate = Date()
    @State  var calendar1 = false
    @State  var calendar2 = false
    @State  var numberOfDays : Int = 0
    
    
    
    
    var body: some View {
        ZStack{
            
            if calendar1{
                calendarFromView(startDate: $startDate, calendar1: $calendar1)
            }
            
            
            if calendar2{
                calendarUntilView(endDate: $endDate, calendar2: $calendar2)
            }
        
        
        VStack {
           
            
            HStack{
                
                
                Button(action: {calendar1.toggle()}, label: {
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
                
                
                Button(action: {calendar2.toggle()}, label: {
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
            }
            
            Text("Days: \(numberOfDays)")
                .padding()
            
            
            Button(action: {
                calculateDaysBetweenDates()
            }, label: {
                Text("Button")
            })
            
            
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
        
        }
        
        
    }
    
    
    
    func calculateDaysBetweenDates() -> Void {
        print(startDate.debugDescription)
        print(endDate.debugDescription)
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
        print(start.debugDescription)
            let end = calendar.startOfDay(for: endDate)
        print(end.debugDescription)
            let components = calendar.dateComponents([.day], from: start, to: end)
            numberOfDays = components.day ?? 0
        }
    
    
    
    
    
    
}
    


#Preview {
    NewTravel()
}



*/

