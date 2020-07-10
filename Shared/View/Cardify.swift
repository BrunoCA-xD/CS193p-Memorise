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
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(fillColor).opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            Angle(degrees: rotation),
            axis: (0,1,0)
        )
    }
    
    
    var fillColor: ColorOrGradientFill
    init(isFaceUp: Bool, fillColor: ColorOrGradientFill) {
        rotation = isFaceUp ? 0 : 180
        self.fillColor = fillColor
    }
}


extension View {
    func cardify(isFaceUp: Bool, fillColor: ColorOrGradientFill) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp, fillColor: fillColor))
    }
}

