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
    
    
    var body: some View {
        ZStack{
            
            if calendar1{
                calendarFromView()
            }
            
            
            if calendar2{
                calendarUntilView()
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
                
                
                Button(action: {calendar1.toggle()}, label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 145, height: 95)
                            .background(Color.gray)
                            .cornerRadius(20)
                        VStack{
                            Text("Until")
                                .fontWeight(.semibold)
                            
                            
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
                
            }
            
        }
    }
    }
    
    
    
    func calculateDaysBetweenDates() -> Int {
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
            let end = calendar.startOfDay(for: endDate)
            let components = calendar.dateComponents([.day], from: start, to: end)
            return components.day ?? 0
        }
    
    
    
    
    
    
}
    


#Preview {
    NewTravel()
}
