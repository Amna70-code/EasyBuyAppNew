//
//  ContentView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import SwiftUI
import CoreData


struct ContentView: View {
    var body: some View {
        VStack {
          Image(systemName: "chair.lounge.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .shadow(radius: 10, y: 10)
            
            
            Text("EasyBuy")
                .padding()
     
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
