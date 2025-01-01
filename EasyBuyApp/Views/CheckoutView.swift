//
//  CheckoutView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//
import SwiftUI

struct CheckoutView: View {
    @State private var email: String = "somya@gmail.com"
    @State private var shippingName: String = "Somya Bhatia"
    @State private var shippingAddress: String = "1234 Rose Terrace Santa Cruz, CA"
    @State private var shippingPhone: String = "(123) 456-7890"
    @State private var paymentMethod: String = "Visa"
    @State private var cardDetails: String = "1234 5678 9012 3456"
    @State private var expiryDate: String = "01/24"
    @State private var cvv: String = "123"
    @State private var useShippingAddress: Bool = true
    @State private var subtotal: String = "$101.00"
    @State private var tax: String = "$9.35"
    @State private var shipping: String = "Free"
    @State private var total: String = "$110.35"
    
    @State private var isEditingEmail = false
    @State private var isEditingShipping = false
    @State private var isEditingPayment = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack {
                    Text("Checkout")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Guest")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.top)
                
                EditableSection(
                    title: "Email",
                    icon: "envelope",
                    content: $email,
                    isEditing: $isEditingEmail
                )
                EditableSection(
                    title: "Shipping",
                    icon: "person",
                    content: $shippingName,
                    isEditing: $isEditingShipping,
                    multiline: true
                )
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text("Payment")
                            .font(.headline)
                        Spacer()
                        Button(action: {
                            isEditingPayment.toggle()
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    if isEditingPayment {
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("Card Details", text: $cardDetails)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("Expiry Date", text: $expiryDate)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            TextField("CVV", text: $cvv)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Toggle(isOn: $useShippingAddress) {
                                Text("Use Shipping Address")
                                    .font(.subheadline)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: .green))
                            
                            Button(action: {
                                isEditingPayment = false
                            }) {
                                Text("Save")
                                    .foregroundColor(.blue)
                            }
                        }
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            HStack {
                                Image(systemName: "creditcard")
                                    .foregroundColor(.gray)
                                Text(paymentMethod)
                            }
                            
                            Text("\(cardDetails) \(expiryDate) \(cvv)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Toggle(isOn: $useShippingAddress) {
                                Text("Use Shipping Address")
                                    .font(.subheadline)
                            }
                            .toggleStyle(SwitchToggleStyle(tint: .green))
                        }
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                VStack(spacing: 10) {
                    SummaryRow(label: "Subtotal", value: subtotal)
                    SummaryRow(label: "Tax", value: tax)
                    SummaryRow(label: "Shipping", value: shipping)
                    
                    Divider()
                    
                    SummaryRow(label: "Total", value: total, isBold: true)
                }
                .padding(.horizontal)
                Button(action: {
                    
                }) {
                    Text("Place Order")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EditableSection: View {
    var title: String
    var icon: String
    @Binding var content: String
    @Binding var isEditing: Bool
    var multiline: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                if isEditing {
                    Button(action: {
                        isEditing = false
                    }) {
                        Text("Save")
                            .foregroundColor(.blue)
                    }
                } else {
                    Button(action: {
                        isEditing = true
                    }) {
                        Image(systemName: "pencil")
                            .foregroundColor(.gray)
                    }
                }
            }
            
            HStack(alignment: .top) {
                Image(systemName: icon)
                    .foregroundColor(.gray)
                    .padding(.top, 3)
                
                if isEditing {
                    if multiline {
                        TextField(content, text: $content, axis: .vertical)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    } else {
                        TextField(content, text: $content)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                } else {
                    Text(content)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct SummaryRow: View {
    var label: String
    var value: String
    var isBold: Bool = false
    
    var body: some View {
        HStack {
            Text(label)
                .font(isBold ? .headline : .subheadline)
            Spacer()
            Text(value)
                .font(isBold ? .headline : .subheadline)
        }
    }
}

struct CheckoutScreen_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
