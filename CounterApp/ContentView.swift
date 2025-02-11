//
//  ContentView.swift
//  CounterApp
//
//  Created by Wylan L Neely on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var countModel = CounterViewModel() // Local state management
    @State private var countBy2 = 0
    
    

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Count: \(countModel.count)")
                    .font(.largeTitle)
                    .padding(10)

                Button("Increase Count") {
                    countModel.count += 1
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                // Navigate to a child view using @Binding
                NavigationLink(destination: CounterDetailView(countBy2: $countBy2)
                    .environmentObject(countModel)
                ) {
                    Text("Decrease Counter")
                }
                .padding()
                .foregroundColor(.red)
                
                Text("Count: \(countBy2)")
                    .font(.largeTitle)
                    .padding(10)

                Button("Increase Count by 2") {
                    countBy2 += 2
                }
            }
            .navigationTitle("Counter App")
        }
    }
}

struct CounterDetailView: View {
    @EnvironmentObject var countModel: CounterViewModel // Receives mutable reference to @State
    @Binding var countBy2: Int

    var body: some View {
        VStack(spacing: 20) {
            Text("Detail Count: \(countModel.count)")
                .font(.title)

            Button("Decrease Count") {
                countModel.count -= 1
                countBy2 -= 1
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("Detail Count: \(countBy2)")
                .font(.title)
        }
    }
}

#Preview {
    ContentView()
}
