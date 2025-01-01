//
//  SignupView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore

struct SignupView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showLoginView = false
    @State private var showError = false
    @State private var errorMessage = ""
    
    var isFormValid: Bool {
        !email.isEmpty && isPasswordValid
    }
    
    var isPasswordValid: Bool {
        let hasUppercase = password.range(of: "[A-Z]", options: .regularExpression) != nil
        return password.count <= 8 && hasUppercase
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 50)
                Image(systemName: "person.crop.circle.badge.exclam")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 150)
                    .foregroundColor(Color.indigo.opacity(0.5))
                    .padding(.bottom, 20)
                
                Text("Sign Up to get started")
                    .font(.system(size: 32, weight: .semibold))
                    .foregroundColor(.indigo)
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
                
                Button(action: {
                    register()
                }) {
                    Text("Sign Up")
                        .font(.headline)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isFormValid ? Color.indigo : Color.gray.opacity(0.5))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                .disabled(!isFormValid)
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.indigo)
                    }
                }
                .padding(.bottom, 20)
            }
            .navigationDestination(isPresented: $showLoginView) {
                LoginView()
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showError = true
            } else {
                self.showLoginView = true
            }
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
