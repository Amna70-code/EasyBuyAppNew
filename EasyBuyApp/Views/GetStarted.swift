//
//  GetStarted.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import SwiftUI
struct GetStarted: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 15) {
                Text("EasyBuy")
                    .bold()
                    .font(.system(size: 40))
                    .padding()
                Image(uiImage: .lampandtable)
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.indigo)
                    .shadow(radius: 10, y: 10)
                    .padding(.top, 150)
                
                Spacer(minLength: 20)
                
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.indigo)
                        .cornerRadius(8)
                }
                .frame(width: 350)
                .padding(.horizontal)
                
                NavigationLink(destination: SignupView()) {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .cornerRadius(8)
                }
                .frame(width: 350)
                .padding(.horizontal)
                
                Spacer(minLength: 30 )
            }
            .padding(.horizontal, 20)
        }
    }
    
    struct GetStarted_Previews: PreviewProvider {
        static var previews: some View {
            GetStarted()
        }
    }
}

