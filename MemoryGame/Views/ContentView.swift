//
//  ContentView.swift
//  MemoryGame
//
//  Created by Trung Lê on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = MemoryGameViewModel()
    
    var body: some View {
        MemoryGameView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
