//
//  ProfilePage.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct ProfilePage: View {
    var body: some View {
        VStack {
            Text("Jones Roger")
                .font(.title.bold())
        }
        .foregroundColor(.white)
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage()
            .background(.black)
    }
}
