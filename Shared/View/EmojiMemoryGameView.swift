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
        Grid(emojiGameVM.cards) { card in
            CardView(card: card).onTapGesture {
                emojiGameVM.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
    
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame())
    }
}
