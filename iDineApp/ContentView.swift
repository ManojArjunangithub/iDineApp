//
//  ContentView.swift
//  iDineApp
//
//  Created by Manoj Kumar on 22/02/24.
//

import SwiftUI

struct ContentView: View {
    
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(menu){ section in
                    Section(section.name) {
                        ForEach(section.items){ item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                                ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Menu")
        }
    }
}

#Preview {
    ContentView()
}
