//
//  LoginView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
struct LoginView: View {
    @State private var isLoginMode = true
    @State private var email: String = ""
    @State private var password: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    private var isLoginEnabled: Bool {
        userLogin()
        return !email.isEmpty && !password.isEmpty

    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 50)
                Image(systemName: "person.crop.circle.badge.checkmark.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .foregroundColor(Color.indigo.opacity(0.5))
                    .padding(.bottom, 20)
                VStack(alignment: .center, spacing: 25) {
                    Text("Login")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.indigo)

                    Text("Login to get started")
                        .font(.system(size: 18, weight: .regular))
                        .foregroundColor(.gray)
                }
                .padding(.bottom, 30)
                TextField("Email", text: $email)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 5)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                HStack {
                    Spacer()
                    Text("Forgot password?")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .padding(.trailing, 20)
                }
                .padding(.bottom, 20)
                NavigationLink(destination: ProductsView()) {
                    Text("Login")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isLoginEnabled ? Color.indigo : Color.gray)
                        .cornerRadius(10)
                        .padding(.horizontal, 50)
                }
                .disabled(!isLoginEnabled)
                
                Spacer()
            }
        }
    }
    func userLogin() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
