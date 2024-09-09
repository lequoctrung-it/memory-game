//
//  MemoryGame.swift
//  MemoryGame
//
//  Created by Trung Lê on 9/9/24.
//

import Foundation

struct MemoryGame {
    var cards: [Card]
    var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func chooseCard(at index: Int) -> Bool {
        if !cards[index].isFaceUp && !cards[index].isMatched {
            if let matchIndex = indexOfTheOneAndOnlyFaceUpCard {
                cards[index].isFaceUp = true
                indexOfTheOneAndOnlyFaceUpCard = nil
                if cards[matchIndex].content == cards[index].content {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    return true
                } else {
                    return false
                }
            } else {
                for i in cards.indices {
                    cards[i].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfTheOneAndOnlyFaceUpCard = index
            }
        }
        return true
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> String) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
        cards.shuffle()
    }
}
