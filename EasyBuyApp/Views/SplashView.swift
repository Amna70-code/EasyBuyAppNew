//
//  SplashView.swift
//  EasyBuyApp
//
//  Created by AMNA BASHIR on 27/12/2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
            NavigationView {
                VStack {
                    if isActive {
                        GetStarted()
                    } else {
                        VStack {
                            Image(uiImage: .sidetable)
                                .resizable()
                                .frame(width: 300, height: 300)
                                .frame(alignment: .center)
                        }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 0.7)) {
                                self.size = 0.9
                                self.opacity = 1.0
                            }
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.isActive = true
                    }
                }
            }
        }
    }
    
    struct SplashView_Previews: PreviewProvider {
        static var previews: some View {
            SplashView()
        }
    }


