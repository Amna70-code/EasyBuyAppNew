//
//  FavoritesView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import SwiftUI
struct FavoritesView: View {
    @Binding var favorites: [Product]
    
    var body: some View {
        NavigationView {
            VStack {
                if favorites.isEmpty {
                    Text("No favorites yet!")
                        .font(.headline)
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(favorites) { product in
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
                        .onDelete { indexSet in
                            favorites.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
