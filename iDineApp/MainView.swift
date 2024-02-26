//
//  MainView.swift
//  iDineApp
//
//  Created by Manoj Kumar on 23/02/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem { Label("Menu", systemImage: "list.dash") }
            OrderView()
                .tabItem { Label("Order", systemImage: "square.and.pencil") }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
