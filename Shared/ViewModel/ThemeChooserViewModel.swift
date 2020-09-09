//
//  ThemeChooserViewModel.swift
//  iOS
//
//  Created by Bruno Cardoso Ambrosio on 08/09/20.
//

import SwiftUI

class ThemeChooserViewModel: ObservableObject {
    @Published private(set) var themes: [Theme]
    private var themeDAO = ThemeDAO()
    
    init() {
        themes = themeDAO.listAll()
        if themes.count <= 0 {
            themes = builtInThemes
            themeDAO.save(themes: builtInThemes)
        }
    }
    
}
