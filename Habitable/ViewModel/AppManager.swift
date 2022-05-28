//
//  AppManager.swift
//  Habitable
//
//  Created by Mason Dierkes on 5/28/22.
//

import Foundation
import Alamofire

@MainActor
class AppManager: ObservableObject {
    
    @Published var habits = [Habit(name: "Feed the Dog", group: "Family", icon: "🐶")]
    @Published var loggedIn = false 
    
    
}
