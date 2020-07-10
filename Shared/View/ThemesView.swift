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
        }
    }
}
struct ThemeCell: View {
    var themeVM: ThemeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            Text(themeVM.title)
                .foregroundColor(themeVM.color)
                .font(.title)
            HStack{
                ForEach(themeVM.symbols, id: \.self) {
                    symbol in
                    Text(symbol)
                }
            }
            
        }
    }
    init(theme: Theme) {
        self.themeVM = ThemeViewModel(theme: theme)
    }
}

struct ThemesView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}

