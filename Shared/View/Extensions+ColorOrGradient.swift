//
//  FillWithColorOrGradient.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 08/07/20.
//

import SwiftUI


extension Text {
    @ViewBuilder
    func foregroundColor(_ fill: LinearGradient) -> some View {
        self
            .foregroundColor(.clear)
            .overlay(fill.mask(self))
    }
}

extension Pie {
    @ViewBuilder
    func foregroundColor(_ fill: LinearGradient) -> some View {
        self
            .foregroundColor(.clear)
            .overlay(fill.mask(self))
    }
}
