//
//  MemoryGame.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 01/07/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    private(set) var score: Score
    
    private var indexOfCardFaceUp: Int? {
        get { cards.indices.filter{ cards[$0].isFaceUp }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfCardFaceUp {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    //match
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score.increaseScore()
                } else {
                    //mismatch
                    if cards[chosenIndex].alreadySeen {
                        score.scorePenalty()
                    }
                    if cards[potentialMatchIndex].alreadySeen {
                        score.scorePenalty()
                    }
                }
                self.cards[chosenIndex].isFaceUp.toggle()
            } else {
                indexOfCardFaceUp = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
            cards.shuffle()
        }
        score = Score()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false{
            didSet {
                if oldValue == true && !isFaceUp{
                    alreadySeen = true
                }
            }
        }
        var isMatched: Bool = false
        var alreadySeen: Bool = false
        var content: CardContent
        
    }
}
