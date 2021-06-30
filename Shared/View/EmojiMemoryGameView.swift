//
//  EmojiMemoryGameView.swift
//  Shared
//
//  Created by Bruno Cardoso Ambrosio on 01/07/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var emojiGameVM: EmojiMemoryGame
    
    var bodyContainer: some View {
        GeometryReader{ geometry in
            VStack(alignment: .leading) {
                Grid(emojiGameVM.cards) { card in
                    CardView(card: card, color: emojiGameVM.themeVM.color).onTapGesture {
                        withAnimation(.easeInOut) {
                            emojiGameVM.choose(card: card)
                        }
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
            }
        }
        .navigationTitle(emojiGameVM.themeVM.title)
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigation) {
                Button("New Game", action: {
                    withAnimation(.easeInOut){
                        emojiGameVM.newGame()
                    }
                })
            }
        })
    }
    
    var body: some View {
        #if os(iOS)
        return bodyContainer.navigationBarTitleDisplayMode(.inline)
        #else
        return bodyContainer
        #endif
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var color: Color
    
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
            ZStack(alignment: .topTrailing){
                Image(card.content)
                    .resizable()
                    .roundedRectangleClipped()
                Group {
                    if card.isConsumingBonusTime{
                        Pie(startAngle: Angle(degrees: 0-90),
                            endAngle: Angle(degrees: -animatedBonusRemaining*360-90),
                            clockwise: true)
                            .onAppear {startBonusTimeAnimation()}
                    } else {
                        Pie(startAngle: Angle(degrees: 0-90),
                            endAngle: Angle(degrees: -card.bonusRemaining*360-90),
                            clockwise: true)
                    }
                }
                .frame(width: size.width * 0.3, height: size.width * 0.3)
                .scaledToFill()
                .padding(5)
                .opacity(0.4)
                .transition(.scale)
            }
            .cardify(isFaceUp: card.isFaceUp)
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
        EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: builtInThemes[0]))
    }
}
