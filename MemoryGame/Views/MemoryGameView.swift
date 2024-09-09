//
//  MemoryGameView.swift
//  MemoryGame
//
//  Created by Trung Lê on 9/9/24.
//

import Foundation
import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: MemoryGameViewModel
    
    let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .padding()
            
            Text("made by Trung & GPT")
                .font(.title2)
                .fontWeight(.medium)
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.cards) {
                    card in CardView(card: card)
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                viewModel.choose(card: card)
                            }
                        }
                }
            }
            .padding()
        }
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MemoryGameViewModel()
        MemoryGameView(viewModel: viewModel)
            .preferredColorScheme(.light)
        MemoryGameView(viewModel: viewModel)
            .preferredColorScheme(.dark)
    }
}
