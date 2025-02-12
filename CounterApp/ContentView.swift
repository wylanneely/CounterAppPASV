//
//  ContentView.swift
//  CounterApp
//
//  Created by Wylan L Neely on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var userDetailsModel = UserDetailsViewModel()

    @State private var countBy2 = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("User: \(userDetailsModel.userName)")
                    .font(.title)
                
                Text("Age: \(userDetailsModel.getAge())")
                    .font(.title2)
                
                Button("Increase Age") {
                    
                    userDetailsModel.increaseAge()
                    
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Text("HighScore: \(countBy2)")
                    .font(.largeTitle)
                    .padding(10)

                Button("Increase Count") {
                    countBy2 += 2
                    userDetailsModel.checkUpdateHighScore(countBy2)
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Button("Reset Counter") {
                    countBy2 = 0
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                NavigationLink(destination: CounterDetailView(countBy2: $countBy2).environmentObject(userDetailsModel)) {
                    Text("Details")
                }
                .padding()
                .foregroundColor(.red)
            }
            .navigationTitle("Counter App")
        }
    }
}


struct CounterDetailView: View {
    
    @EnvironmentObject var countModel: UserDetailsViewModel
    
    @Binding var countBy2: Int
    @State private var newName: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail Count: \(countBy2)")
                .font(.title)
                
            Text("User: \(countModel.userName)")
                .font(.title2)
            
            Text("Age: \(countModel.getAge())")
                .font(.title2)
            
            Text("HighScore: \(countModel.highScore)")
                .font(.title2)
            
            Button("Decrease Count") {
                countBy2 -= 2
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            TextField("Enter new name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
            Button("Update Name") {
                countModel.updateUserName(newName) // you want to do this to account for testing
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ContentView()
}
