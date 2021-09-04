//
//  ThemesView.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import SwiftUI

struct ThemesView: View {
    var themes: [Theme] = builtInThemes
    var body: some View {
        if isMacOS {
            bodyContainer.toolbar(content: {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            })
        } else {
            bodyContainer
        }
    }
    
    private var bodyContainer: some View {
        NavigationView{
            List{
                ForEach(themes){ theme in
                    NavigationLink(
                        destination: EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: theme))) {
                            ThemeCell(theme: theme)
                    }
                }
            }
            .navigationTitle("Themes")
            EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: builtInThemes.randomElement()!))
        }
    }
    
    private func toggleSidebar() {
        #if os(macOS)
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
    
    private var isMacOS: Bool {
        #if os(macOS)
        return true
        #endif
        return false
    }
}

struct ThemeCell: View {
    var theme: Theme
    var body: some View {
        Text("\(theme.title)")
            .font(.title)
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}

