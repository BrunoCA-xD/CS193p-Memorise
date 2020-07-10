//
//  FillWithColorOrGradient.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 08/07/20.
//

import SwiftUI

extension RoundedRectangle {
    
    @ViewBuilder
    func fill(_ colorOrGradient: ColorOrGradientFill) -> some View {
        if colorOrGradient.color != nil {
            self.fill(colorOrGradient.color!)
        }else {
            self.fill(colorOrGradient.gradient!)
        }
    }
}

extension Text {
    
    @ViewBuilder
    func foregroundColor(_ fill: ColorOrGradientFill) -> some View {
        if fill.color != nil {
            self.foregroundColor(fill.color!)
        }else {
            self
                .foregroundColor(.clear)
                .overlay(fill.gradient!.mask(self))
        }
    }
}

extension Pie {
    @ViewBuilder
    func foregroundColor(_ fill: ColorOrGradientFill) -> some View {
        if fill.color != nil {
            self.foregroundColor(fill.color!)
        }else {
            self
                .foregroundColor(.clear)
                .overlay(fill.gradient!.mask(self))
        }
    }
}
