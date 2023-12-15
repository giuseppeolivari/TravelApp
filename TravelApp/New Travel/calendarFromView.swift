//
//  calendarFromView.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 11/12/23.
//

import SwiftUI
import SwiftData



struct calendarFromView: View {
    
    @Binding  var startDate : Date
    @Binding  var calendar1 : Bool
  
    
        
    
    var body: some View {
        
        
        
            
            
            VStack{
                
                Text("From")
                    .font(.title2)
                DatePicker("", selection: $startDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                Button("Save") {
                    calendar1.toggle()
                }
                
            }.background(Color.gray)
            .cornerRadius(30.0)
        
    }
    
        
    
}
#Preview {
    calendarFromView(startDate: .constant(Date()), calendar1: .constant(false))
}
