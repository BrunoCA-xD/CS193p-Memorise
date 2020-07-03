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
        GeometryReader{ geometry in
            VStack(alignment: .leading) {
                Text(emojiGameVM.themeVM.title)
                    .font(.largeTitle)
                Grid(emojiGameVM.cards) { card in
                    CardView(card: card).onTapGesture {
                        emojiGameVM.choose(card: card)
                    }
                    .foregroundColor(emojiGameVM.themeVM.color)
                    .padding(5)
                }
                Divider()
                HStack{
                    Spacer()
                    Text("Score: \(emojiGameVM.score)")
                        .font(.title)
                    Spacer()
                }
                
                .background(Color(UIColor.systemBackground))
            }
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button("New Game", action: {
            emojiGameVM.newGame()
        }))
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
        EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: builtInThemes[5]))
    }
}
