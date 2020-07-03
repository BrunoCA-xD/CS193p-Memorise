//
//  MemoryGame.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 01/07/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        let chosenIndex = index(of: card)!
        print(chosenIndex)
        self.cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            cards.shuffle()
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
            
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        
    }
}
