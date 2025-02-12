//
//  CounterViewModel.swift
//  CounterApp
//
//  Created by Wylan L Neely on 2/10/25.
//

import SwiftUI
import Combine

class UserDetailsViewModel: ObservableObject {
    
   @Published var userName: String = "Wylan"
   @Published private var age: Int = 30
   @Published private(set) var highScore: Int = 0
    
    func checkUpdateHighScore(_ score: Int){
        if score > highScore {
            highScore = score
        }
    }
    
    func increaseAge() {
        age += 1
    }
    
    func getAge()-> Int {
        return age
    }
    
    func updateUserName(_ name: String) {
        userName = name.capitalized
    }
}
