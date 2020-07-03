//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by Bruno Cardoso Ambrosio on 01/07/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGameVM: EmojiMemoryGame
    
    var body: some View {
        HStack {
            ForEach(emojiGameVM.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        emojiGameVM.choose(card: card)
                    }
            }
        }
        .padding()
        .foregroundColor(.orange)
        .font(emojiGameVM.cardsFont)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 3)
                Text(card.content)
            }else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
    
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame())
    }
}
