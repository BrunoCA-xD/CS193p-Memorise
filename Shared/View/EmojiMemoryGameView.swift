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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Pie(startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 20), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    // MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
}


struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: builtInThemes[5]))
    }
}
