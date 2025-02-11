//
//  CounterViewModel.swift
//  CounterApp
//
//  Created by Wylan L Neely on 2/10/25.
//

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    @Published var count = 0  // Observable property
}
