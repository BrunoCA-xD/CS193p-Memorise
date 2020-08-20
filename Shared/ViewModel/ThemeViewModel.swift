//
//  ThemeViewModel.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import SwiftUI

class ThemeViewModel: ObservableObject {
    @Published private(set) var theme: Theme
    
    var symbols: [String] {
        theme.symbols
    }
    
    var title: String {
        theme.title
    }
    
    var color: LinearGradient {
        let colors = theme.colors.map {
            Color($0)
        }
        return LinearGradient(gradient: .init(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    init(theme: Theme) {
        self.theme = theme
    }
    
}

