//
//  Card.swift
//  MemoryGame
//
//  Created by Trung Lê on 9/9/24.
//

import Foundation

struct Card: Identifiable {
    var id: UUID = UUID()
    var content: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
}
