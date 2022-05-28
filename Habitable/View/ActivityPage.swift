//
//  ActivityPage.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct ActivityPage: View {
    

    
    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
             
            ScrollView {
//                VStack(alignment: .leading) {
//
//                    Text("Activity")
//                        .font(.largeTitle.bold())
//                        .padding(.horizontal)
//
//                    ScrollView(.horizontal, showsIndicators: false) {
//
//                        SmallTaskView()
//
//
//                    }
//                    .offset(x: 10)
                    
                    Text("Groups")
                        .font(.largeTitle.bold())
                        .padding(.horizontal)
                    
                
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("XC 2022")
                                    .font(.title2)
                                Text("Kevin Completed a workout")
                                    .font(.headline)
                            }
                            Spacer()
                            Text("🍍")
                        }
                        Divider()
                            .background(.white)
                    }
                    .padding(.top, 1)
                    .padding(.horizontal)
                    
                }
                .foregroundColor(.white)
            }
        }
//    }
}

struct SmallTaskView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Feed the Dog")
                .font(.title2.bold())
            Text("Family")
                .font(.title3)
            
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 50)
            
            Text("Sienna")
        }
        .frame(width: 150, height: 150)
        .padding()
        .background(Color("Secondary"))
        .cornerRadius(8)
        
    }
   
    
}

struct ActivityPage_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPage()
    }
}
