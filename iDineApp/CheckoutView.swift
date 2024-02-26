//
//  CheckoutView.swift
//  iDineApp
//
//  Created by Manoj Kumar on 23/02/24.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    @State private var paymentType = "Cash"

    
    @State var addLoyaltyDetails = false
    @State var loyaltyNumber = ""
    
    let tipAmounts = ["10", "15", "20", "25", "30", "0"]
    @State private var tipAmount = "20"
    
    
    @State var showingPaymentAlert = false

    var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)!
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("How do you want to pay?", selection: $paymentType){
                        ForEach(paymentTypes, id: \.self){
                            Text($0)
                        }
                    }
                    Toggle("Add iDine Loyalty card", isOn: $addLoyaltyDetails.animation())
                    if addLoyaltyDetails{
                        TextField("Enter your iDine ID", text: $loyaltyNumber)
                    }
                }
                Section("Add a Tip?"){
                    Picker("Percentage:", selection: $tipAmount){
                        ForEach(tipAmounts, id: \.self){
                            Text("%\($0)")
                        }
                    }.pickerStyle(.segmented)
                }
                Section("Total: \(totalPrice)"){
                    Button("Confirm Order"){
                        showingPaymentAlert.toggle()
                    }
                }
            }
            .navigationTitle("Payment")
            .navigationBarTitleDisplayMode(.inline)
            .alert("Order Confirmed", isPresented: $showingPaymentAlert) {
                // Add your custom button here
            } message: {
                Text("Your Total was \(totalPrice) - Thank you!!!")
            }
        }
    }
}

#Preview {
    CheckoutView()
        .environmentObject(Order())
}
