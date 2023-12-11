//
//  calendarFromView.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 11/12/23.
//

import SwiftUI



struct calendarFromView: View {
    
    @Binding  var startDate : Date
    
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
        DatePicker("From", selection: $startDate, displayedComponents: .date)
        .datePickerStyle(WheelDatePickerStyle())
            .padding()
        
        
    }
}

#Preview {
    calendarFromView(startDate: )
}
