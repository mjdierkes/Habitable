//
//  Task.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import Foundation

struct Habit: Identifiable  {
    let name: String
    let group: String
    let icon: String
    var completed = false
    let id = UUID()
}
