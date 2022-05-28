//
//  UserView.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        HStack {
            Image("person")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text("Thomas Freddy")
                    .font(.title2.bold())
                Text("@theManTom")
                
            }
        }
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(8)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
