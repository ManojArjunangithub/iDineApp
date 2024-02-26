//
//  iDineAppApp.swift
//  iDineApp
//
//  Created by Manoj Kumar on 22/02/24.
//

import SwiftUI

@main
struct iDineAppApp: App {
    @StateObject var order = Order() // Property Wrapper -- Making new order object when app is launched for the contetnView. this responsible for keeping the object alive to the entire lifetime of our program.
    
    // ObservableObject Protocol --> anything confirms this protocols can be used inside Swiftui like this. That, i'm publishing the data so UI can be updated.
    
    // Published wrapper --> Whenever it finds changes that sends an announcement.
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order) // Passing the order object to the ContentView
        }
    }
}

// Observable Object Protocol + @ environment property wrapper is doing all these things. and make sure all the data's are in sync
