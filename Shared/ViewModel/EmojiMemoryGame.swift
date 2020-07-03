//
//  EmojyMemoryGame.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 01/07/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String>!
    @Published private(set) var themeVM: ThemeViewModel
    
    func createMemoryGame() -> MemoryGame<String> {
        let randomPairNumber = Int.random(in: themeVM.symbols.count/2...themeVM.symbols.count)
        return MemoryGame<String>(numberOfPairsOfCards: randomPairNumber) { pairIndex in themeVM.symbols[pairIndex] }
    }
    // MARK: - Access to the model
    var cards: Array<MemoryGame<String>.Card> {
        return game.cards
    }
    
    var score: String {
        "\(game.score.value)"
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
    
    func newGame() {
        self.themeVM = ThemeViewModel(theme: builtInThemes.randomElement() ?? builtInThemes[0]) 
        game = createMemoryGame()
        
    }
    
    init(theme: Theme){
        self.themeVM = ThemeViewModel(theme: theme)
        game = createMemoryGame()
        
    }
    
}
