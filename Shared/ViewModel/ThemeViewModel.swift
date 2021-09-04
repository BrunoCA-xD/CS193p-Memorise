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
    
    var color: Color? {
        return theme.color != nil ? Color(theme.color!) : nil
    }
    
    var cardIllustration: Image? {
        return theme.backIllustration != nil ?
            Image(theme.backIllustration!)
            : nil
    }
    
    init(theme: Theme) {
        self.theme = theme
    }
}
