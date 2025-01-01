//
//  ProductsView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//
import SwiftUI

struct Product: Identifiable, Equatable{
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
}

struct ProductsView: View {
    @State private var selectedProduct: Product? = nil
    @State private var cart: [Product] = []
    @State private var favorites: [Product] = []
    
    let products: [Product] = [
        Product(name: "Chair", price: "$50", imageName: "sofa1"),
        Product(name: "Bed", price: "$200", imageName: "sofa2"),
        Product(name: "Side Table", price: "$30", imageName: "sofa3"),
        Product(name: "Sofa", price: "$300", imageName: "sofa4"),
        Product(name: "Chair", price: "$50", imageName: "sofa5"),
        Product(name: "Side Table", price: "$30", imageName: "lamp_and_chair"),
        Product(name: "Bed", price: "$300", imageName: "bed1"),
        Product(name: "Bed", price: "$300", imageName: "bed2"),
        Product(name: "Chair", price: "$50", imageName: "sofa8"),
        Product(name: "White Chair", price: "$200", imageName: "sofa9"),
        Product(name: "Comfortable Brown Leather Chair", price: "$30", imageName: "sofa10"),
        Product(name: "Green Console", price: "$300", imageName: "console"),
        Product(name: "Study Table", price: "$200", imageName: "studytable")
    ]
    
    var body: some View {
        TabView {
            NavigationView {
VStack {
    ScrollView {
        LazyVGrid(columns: [
            GridItem(.flexible(minimum: 150), spacing: 20),
            GridItem(.flexible(minimum: 150), spacing: 20)
        ], spacing: 20) {
            ForEach(products) { product in
                if selectedProduct == nil || selectedProduct == product {
                    VStack {
                        Image(product.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: selectedProduct == product ? 350 : 200)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .onTapGesture {
                                withAnimation {
                                    selectedProduct = selectedProduct == product ? nil : product
                                }
                            }
                        
                        if selectedProduct == nil {
                            Text(product.name)
                                .font(.headline)
                            
                            Text(product.price)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            HStack {
                                Button(action: {
                                    toggleFavorite(product)
                                }) {
                                    Image(systemName: favorites.contains(product) ? "heart.fill" : "heart")
                                        .foregroundColor(.red)
                                }
                                Spacer()
                                Button(action: {
                                    addToCart(product)
                                }) {
                                    Text("Add to Cart")
                                        .font(.footnote)
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.blue)
                                        .cornerRadius(8)
                                }
                            }
                            .padding(.top, 8)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                    .shadow(color: Color.gray.opacity(0.3), radius: 8, x: 0, y: 3)
                }
            }
        }
        .padding()
        }
        }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Products")
                            .font(.headline)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CartView(cart: $cart)) {
                            HStack {
                                Image(systemName: "cart")
                                Text("\(cart.count)")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                        }
                    }
                    
                }
            }
            .tabItem {
                Label("Products", systemImage: "cart")
            }
            
            FavoritesView(favorites: $favorites)
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            CartView(cart: $cart)
                .tabItem {
                    Label("Cart", systemImage: "bag")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func addToCart(_ product: Product) {
        if !cart.contains(product) {
            cart.append(product)
        }
    }
    
    private func toggleFavorite(_ product: Product) {
        if favorites.contains(product) {
            favorites.removeAll { $0 == product }
        } else {
            favorites.append(product)
        }
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
    }
}
