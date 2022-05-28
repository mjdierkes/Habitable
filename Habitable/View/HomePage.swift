//
//  HomePage.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct HomePage: View {
    
    @StateObject var manager = AppManager()
    @State private var selection = 0
    @State private var presented = false
    
    var body: some View {
        
        ZStack {
            Color("Background").ignoresSafeArea()
            
            VStack {
                
                HStack {
                    Spacer()
                    Button {
                        presented.toggle()
                    } label: {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    
                }
                .padding()
                
                Text("Tasks")
                    .font(.title.bold())
                
                
                TabView(selection: $selection) {
                    ForEach($manager.habits) { habit in
                        TaskView(habit: habit)
                    }
                }
                .frame(height: 400)
                .tabViewStyle(.page)
                
                
                Button("Complete") {
                    withAnimation {
                        manager.habits[selection].completed.toggle()
                    }
                }
                .buttonStyle(.borderedProminent)
//                Text("James Freddy")
//                    .bold()
//                    .padding(.vertical, 7)
//                    .padding(.horizontal, 10)
//                    .background(Color("Secondary"))
//                    .cornerRadius(8)
            }
        }
        .sheet(isPresented: $presented) {
            AddHabitView()
                .environmentObject(manager)
        }
        .onChange(of: selection, perform: { newValue in
            let generator = UIImpactFeedbackGenerator(style: .medium)
                       generator.impactOccurred()
        })
        .foregroundColor(.white)
       
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
