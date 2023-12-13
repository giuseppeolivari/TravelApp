//
//  calendarUntilView.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 11/12/23.
//

import SwiftUI

struct calendarUntilView: View {
    @Binding  var endDate : Date
    @Binding  var calendar2 : Bool
    
    
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        
            
            
            VStack{
                
                Text("Until")
                DatePicker("", selection: $endDate, displayedComponents: .date)
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                    
                
                
                
                Button("Save") {
                    calendar2.toggle()
                }
                   /*
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 145, height: 95)
                            .background(Color.yellow)
                            .cornerRadius(20)
                        
                        Text("Save")
                            .fontWeight(.semibold)
                        
                        
                    }
                */
                
            }.background(Color.gray)
            .cornerRadius(25.0)
        
    }
}

#Preview {
    calendarUntilView(endDate: .constant(Date()), calendar2: .constant(false))
}
