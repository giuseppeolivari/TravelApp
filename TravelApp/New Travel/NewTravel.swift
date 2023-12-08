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
    
    
    var body: some View {
        VStack {
                    
            /*
            .sheet(isPresented: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is Presented@*/.constant(false)/*@END_MENU_TOKEN@*/) {
                Group{
                    //Text("data iniziale")
                    DatePicker("From", selection: $startDate, displayedComponents: .date)
                        //.datePickerStyle(WheelDatePickerStyle())
                        .padding()
                    
                    //Text("finale")
                    DatePicker("To", selection: $endDate, displayedComponents: .date)
                    //.datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                    
                    Text("Giorni trascorsi: \(calculateDaysBetweenDates())")
                        .padding()
                    
                }
            }
            */

            Group{
                //Text("data iniziale")
                DatePicker("From", selection: $startDate, displayedComponents: .date)
                    //.datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                //Text("finale")
                DatePicker("To", selection: $endDate, displayedComponents: .date)
                //.datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                Text("Giorni trascorsi: \(calculateDaysBetweenDates())")
                    .padding()
                
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
