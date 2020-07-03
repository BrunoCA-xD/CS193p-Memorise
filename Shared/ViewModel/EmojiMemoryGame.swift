//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 01/07/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🕷", "💀", "👺"]
        let randomPairNumber = Int.random(in: 2...emojis.count)
        return MemoryGame<String>(numberOfPairsOfCards: randomPairNumber) { pairIndex in emojis[pairIndex] }
    }
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    var pairNumber: Int {
        game.cards.count/2
    }
    
    var cardsFont: Font {
        return pairNumber<=4 ? .largeTitle : .title
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    
}
