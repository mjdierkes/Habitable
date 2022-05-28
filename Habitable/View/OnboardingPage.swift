//
//  OnboardingView.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct OnboardingPage: View {
    
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 10) {
                Text("Welcome to \nHabitable")
                    .font(.largeTitle.bold())
                    

                Text("Select some contacts to keep you accountable.")
                    .font(.headline)
                
                ForEach(0..<3) { _ in
                    UserView()
                }
                
                
                Spacer()
                    .frame(height: 40)
            }
            .multilineTextAlignment(.center)
            .padding()

        }
        .foregroundColor(.white)

    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPage()
    }
}
