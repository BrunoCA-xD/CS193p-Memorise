//
//  Cardiify.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
    var rotation: Double
    var cardBack: CardBackFace
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get { return rotation }
        set { rotation = newValue }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Group{
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                content
                
            }
            .opacity(isFaceUp ? 1 : 0)
            cardBack.opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            Angle(degrees: rotation),
            axis: (0,1,0)
        )
    }
    
    init(isFaceUp: Bool, cardBack: CardBackFace) {
        rotation = isFaceUp ? 0 : 180
        self.cardBack = cardBack
    }
}

extension View {
    func cardify(isFaceUp: Bool, cardBack: CardBackFace) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, cardBack: cardBack))
    }
}

public struct CardBackFace: View {
    var image: Image?
    
    init(image: Image?) {
        self.image = image
    }
    
    public var body: some View {
        if let themeIllustration = image {
            themeIllustration
                .resizable()
                .roundedRectangleClipped()
        } else {
            RoundedRectangle(cornerRadius: 10).fill()
        }
    }
}
    
