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
        case "Halloween": return .orange
        case "Faces": return .yellow
        case "Flags": return .gray
        case "Food": return .red
        case "Places": return .purple
        case "Vehicles": return .blue
        default: return .pink
        }
    }
    
    init(theme: Theme) {
        self.theme = theme
    }
}
