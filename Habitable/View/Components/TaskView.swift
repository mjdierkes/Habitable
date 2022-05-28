//
//  LargeTaskView.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import SwiftUI

struct TaskView: View {
    
    @Binding var habit: Habit
    let size: CGFloat = 300
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text(habit.name)
                            .font(.title2.bold())
                        Text(habit.group)
                    }
                    Spacer()
                }
                .padding(.top, 30)
                .padding(.horizontal, 30)
                
                Spacer()
                
                Text(habit.icon)
                    .scaleEffect(4)
                
                Spacer()
                
            }
           
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.white, lineWidth: habit.completed ? 15 : 0)
                )
            .frame(width: size, height: size)
            .background(Color("Secondary"))
            .cornerRadius(18)
            .padding()
            
        }
        .foregroundColor(.white)
    }
}
//
//struct LargeTaskView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskView()
//    }
//}
