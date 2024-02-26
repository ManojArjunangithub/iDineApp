//
//  OrderView.swift
//  iDineApp
//
//  Created by Manoj Kumar on 23/02/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ForEach(order.items) { item in
                        HStack{
                            HStack{
                                Image(item.mainImage)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                Text(item.name)
                            }
                            Spacer()
                            Text("$ \(item.price)")
                        }
                    }.onDelete(perform: { indexSet in
                        deleteItems(at: indexSet)
                    })
                }
                Section{
                    NavigationLink("Place Order"){
                        CheckoutView()
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .toolbar{
                EditButton()
            }
        }
    }
    func deleteItems(at indexSet: IndexSet){
        order.items.remove(atOffsets: indexSet)
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
