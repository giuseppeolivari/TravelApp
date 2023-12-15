//
//  Travel.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 14/12/23.
//

import Foundation
import SwiftData

@Model
class Travel: Identifiable {
    
    var id = UUID()
    var name: String
    var photo: Data?
    var daysNumber: Int = 0
    var dates: [Date]?
    
    
    var notes: [DataNote] = []
    
    
    init(name: String ){
        self.name = name
    }
    
}
