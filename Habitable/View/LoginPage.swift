//
//  SignInPage.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

/// This allows the user to login to the app.
struct LoginPage: View {
    
    @EnvironmentObject var manager: AppManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        ZStack {
            Color("Background")
            VStack(alignment: .leading) {
                

                Text("Login")
                    .font(.largeTitle)
                
                StudentCredentialsView(username: $username, password: $password)
                
                Spacer()
                    .frame(minHeight: 150)
                
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .padding()
        }
    }
}


/// Allows the user to log into the app.
/// Makes a request to the AppManager with the student's credentials.
struct StudentCredentialsView: View {
    
    @EnvironmentObject var manager: AppManager
    @Binding var username: String
    @Binding var password: String

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
                .textContentType(.password)
                .padding(.bottom, 60)
            
            Button {
                manager.loggedIn.toggle() 
            } label: {
                Text("Login")
            }
            
//            AsyncButton("Sign In", action: loadData)
//                .font(.headline)
//                .foregroundColor(Color("FlippedText"))
//                .padding(.vertical)
//                .tint(Color("Text"))
//                .buttonStyle(.borderedProminent)
//                .controlSize(.large)
        }
        .navigationBarBackButtonHidden(true)
    }
    
    /// Helper function to load the student data.
    /// Calls the Manager's load data functions.
    /// Resets the username and password for security purposes.
    func loadData() async {
//        do {
//            try await manager.loadData(username: username, password: password, newSignIn: true)
//            username = ""
//            password = ""
//            manager.error = ""
//        } catch {
//            manager.error = error.localizedDescription
//            print(manager.error)
//        }
    }
}
//
//struct SignInPage_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginPage()
//    }
//}
