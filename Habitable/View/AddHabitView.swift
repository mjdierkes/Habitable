//
//  AddHabitView.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct AddHabitView: View {
    
    @EnvironmentObject var manager: AppManager
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var group = ""
    @State private var icon = ""
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            
            VStack {
                
                Text("New Habit")
                    .font(.largeTitle.bold())
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
                TextField("Group", text: $group)
                    .textFieldStyle(.roundedBorder)
                TextField("Icon", text: $icon)
                    .textFieldStyle(.roundedBorder)
                
                Button {
                    manager.habits.append(Habit(name: name, group: group, icon: icon))
                    dismiss()
                } label: {
                    Text("Add Habit")
                }
                .buttonStyle(.borderedProminent)
            }
            .foregroundColor(.white)
            .padding()
        }
      
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView()
    }
}
