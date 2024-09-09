//
//  MemoryGameViewModel.swift
//  MemoryGame
//
//  Created by Trung Lê on 9/9/24.
//

import Foundation

class MemoryGameViewModel: ObservableObject {
    @Published private var model: MemoryGame
    
    init() {
        model = MemoryGame(numberOfPairsOfCards: 4) {
            pairIndex in ["🍎", "🍊", "🍇", "🍓"][pairIndex]
        }
    }
    
    var cards: [Card] {
        model.cards
    }
    
    func choose(card: Card) {
        if let index = model.cards.firstIndex(where: { $0.id == card.id }) {
            let isMatch = model.chooseCard(at: index)
            
            if !isMatch {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    for i in self.model.cards.indices {
                        self.model.cards[i].isFaceUp = false
                    }
                }
            }
        }
    }
}
