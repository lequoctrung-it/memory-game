//
//  CardView.swift
//  MemoryGame
//
//  Created by Trung Lê on 9/9/24.
//

import SwiftUI

struct CardView: View {
    var card: Card
    
    var body: some View {
        ZStack {
            if card.isFaceUp || card.isMatched {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
                    .font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.blue)
            }
        }
        .frame(width: 80, height: 80)
    }
}

struct CardView_PreViews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(content: "🍎", isMatched: true))
            .previewLayout(.sizeThatFits)
        CardView(card: Card(content: "🍎", isFaceUp: false, isMatched: false))
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)

    }
}
