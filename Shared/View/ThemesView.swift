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
            .toolbar(content: {
                ToolbarItem(placement: .navigation) {
                    Button(action: toggleSidebar, label: {
                        Image(systemName: "sidebar.left")
                    })
                }
            })
        }
    }
    
    private func toggleSidebar() {
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
}
struct ThemeCell: View {
    var theme: Theme
    var body: some View {
        VStack(alignment:.leading) {
            Text("\(theme.title)")
                .font(.title)
        }
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}

