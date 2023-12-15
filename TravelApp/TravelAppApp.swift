//
//  TravelAppApp.swift
//  TravelApp
//
//  Created by Giuseppe Olivari on 07/12/23.
//

import SwiftUI

@main
struct TravelAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainPage()
            
        }
        .modelContainer(for: Travel.self) //aggiunto
    }
}
