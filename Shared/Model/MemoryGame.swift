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
                if isFaceUp{
                    startUsingBonusTime()
                } else {
                    stopUsingBonusTime()
                }
            }
        }
        
        var isMatched: Bool = false{
            didSet{
                stopUsingBonusTime()
            }
        }
        var alreadySeen: Bool = false
        var content: CardContent
        
        // MARK: - Bonus time
        
        // this could give matching bonus points
        // if the user matches the card
        // before a certain amount of time passes during which the card is face up
        
        // Can be zero wich means "no bonus available"  for this card
        var bonusTimeLimit: TimeInterval = 6
        
        // How long this card has ever been face up
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return pastFaceUpTime + Date().timeIntervalSince(lastFaceUpDate)
            }else {
                return pastFaceUpTime
            }
        }
        
        // the last time this card was turned face up (and is still face up)
        var lastFaceUpDate: Date?
        
        // the accumulated time this card has been face up in the past
        // (i.e. not including the current time it's been face up if it is currently so_
        var pastFaceUpTime: TimeInterval = 0
        
        // how much time left before the bonus opportunity runs out
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        // percentage of the bonus time remaining
        var bonusRemaining: Double {
            (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        // Whether the card was matched during the bonus time period
        var hasEarnedBonus: Bool {
            isMatched && bonusTimeRemaining > 0
        }
        
        // Wheter we are currentle face up, unmatched and have not yet used the bonus window
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        // called when the card transitions to face up state
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        // called when the card goes back face down (or gets matched)
        private mutating func stopUsingBonusTime() {
            pastFaceUpTime = faceUpTime
            self.lastFaceUpDate = nil
        }
    }
}
