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
    
    var color: ColorOrGradientFill {
        var color: Color? = nil
        var gradient: LinearGradient? = nil
        
        switch theme.title {
        case "Halloween": color = .orange
        case "Faces": color = .yellow
        case "Vehicles": color = .blue
        case "Places": color = .gray
        case "Food":
            gradient = LinearGradient(gradient: .init(colors: [.red, .yellow, .orange]), startPoint: .bottomLeading, endPoint: .topTrailing)
        default:
            gradient = LinearGradient(gradient: Gradient(colors: [.red,.blue]), startPoint: .bottomLeading, endPoint: .topTrailing)
        }
        return ColorOrGradientFill(color: color, gradient: gradient)!
    }
    
    init(theme: Theme) {
        self.theme = theme
    }
    
}

struct ColorOrGradientFill {
    let color: Color?
    let gradient: LinearGradient?
    
    init?(color: Color? = nil, gradient: LinearGradient? = nil) {
        self.color = color
        self.gradient = gradient
        
        if color == nil && gradient == nil {
            return nil
        }
    }
}
