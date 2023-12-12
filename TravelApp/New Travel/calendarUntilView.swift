//
//  calendarUntilView.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 11/12/23.
//

import SwiftUI

struct calendarUntilView: View {
    @Binding  var endDate : Date
    
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        NavigationStack{
            
            
            VStack{
                
                
                DatePicker("Until", selection: $endDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                
                
                
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 145, height: 95)
                            .background(Color.yellow)
                            .cornerRadius(20)
                        
                        Text("Save")
                            .fontWeight(.semibold)
                        
                        
                    }
                
                
            }.background(Color.gray)
        }
    }
}

#Preview {
    calendarUntilView(endDate: .constant(Date()))
}
