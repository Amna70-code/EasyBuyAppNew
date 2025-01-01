//
//  CartView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//
//
import SwiftUI

struct CartView: View {
    @Binding var cart: [Product]

    var total: String {
        let totalPrice = cart.reduce(0) { result, product in
            result + (Int(product.price.replacingOccurrences(of: "$", with: "")) ?? 0)
        }
        return "$\(totalPrice)"
    }

    var body: some View {
        NavigationView {
            VStack {
                if cart.isEmpty {
                    Text("Your cart is empty!")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List {
                        ForEach(cart) { product in
                            HStack {
                                Image(product.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(product.name)
                                        .font(.headline)

                                    Text(product.price)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }

                    HStack {
                        Spacer()
                        Text("Total: \(total)")
                            .font(.title2)
                            .bold()
                            .padding()
                    }

                    NavigationLink(destination: CheckoutView()) {
                        Text("Checkout Here")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .navigationBarBackButtonHidden(true)
                }
                   
            }
        }
    }
}
