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
                    .foregroundColor(emojiGameVM.themeVM.color)
                    .font(.largeTitle)
                Grid(emojiGameVM.cards) { card in
                    CardView(card: card, fillColor: emojiGameVM.themeVM.color).onTapGesture {
                        withAnimation(.easeInOut) {
                            emojiGameVM.choose(card: card)
                        }
                    }
//                    .foregroundColor(emojiGameVM.themeVM.color)
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
            withAnimation(.easeInOut){
                emojiGameVM.newGame()
            }
        }))
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var fillColor: LinearGradient
    
    var body: some View {
        GeometryReader { geometry in
            body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemaining: Double = 0
    
    private func startBonusTimeAnimation() {
        animatedBonusRemaining = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)){
            animatedBonusRemaining = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Group {
                    if card.isConsumingBonusTime{
                        Pie(startAngle: Angle(degrees: 0-90),
                            endAngle: Angle(degrees: -animatedBonusRemaining*360-90),
                            clockwise: true)
                            .foregroundColor(fillColor)
                            .onAppear {startBonusTimeAnimation()}
                    }else {
                        Pie(startAngle: Angle(degrees: 0-90),
                            endAngle: Angle(degrees: -card.bonusRemaining*360-90),
                            clockwise: true)
                            .foregroundColor(fillColor)
                    }
                }
                .padding(5)
                .opacity(0.4)
                .transition(.scale)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle(degrees: card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp, fillColor: fillColor)
            .transition(AnyTransition.scale)
        }
    }
    
    // MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
    
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: builtInThemes[2]))
    }
}
