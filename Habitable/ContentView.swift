//
//  ContentView.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var page = 1
    @StateObject var manager = AppManager()
    @State private var presented = false
    
    var body: some View {
        
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            if page == 0 {
                ActivityPage()

            }
//
            if page == 1 {
                HomePage()
            }
//
            if page == 2 {
                ProfilePage()
            }

            VStack {
                Spacer()
                HStack(spacing: 40) {
                    Button("Activity") {
                        page = 0
                    }
                    Button("Home") {
                        page = 1
                    }

                    Button("Profile") {
                        page = 2
                    }
                }
                .foregroundColor(.white)
                .padding()
            }
          
           
            if !manager.loggedIn {
                LoginPage()
                    .environmentObject(manager)
            }
            
        }
        .onAppear {
            presented.toggle()
        }
        .sheet(isPresented: $presented) {
            OnboardingPage()
        }
        
       

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
