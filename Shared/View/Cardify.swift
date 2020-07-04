//
//  Cardiify.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import SwiftUI

struct Cardify: ViewModifier {
    // MARK: - Drawing Constants
    private let cornerRadius: CGFloat = 10
    private let edgeLineWidth: CGFloat = 3
    
   /*@State*/ var isFaceUp: Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: edgeLineWidth)
                content
            }else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
    }
}


extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
