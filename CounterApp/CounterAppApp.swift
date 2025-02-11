//
//  CounterAppApp.swift
//  CounterApp
//
//  Created by Wylan L Neely on 2/10/25.
//

import SwiftUI

@main
struct CounterAppApp: App {
    @StateObject var countModel = CounterViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
                    .environmentObject(countModel)
            }
        }
    }
}
