//
//  ThemeViewModel.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published private var theme: Theme
    
    var symbols: [String] {
        theme.symbols
    }
    
    var title: String {
        theme.title
    }
    var color: Color {
        switch theme.title {
        case "Halloween": return Color("halloween.card")
        case "Comediantes": return Color("comediantes.card")
        default: return .blue
        }
    }
    
    init(theme: Theme) {
        self.theme = theme
    }
}
