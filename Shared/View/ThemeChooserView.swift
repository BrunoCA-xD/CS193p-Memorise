//
//  ThemesView.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import SwiftUI

struct ThemeChooserView: View {
    @ObservedObject var chooserViewModel: ThemeChooserViewModel
    var body: some View {
        NavigationView{
            List{
                ForEach(chooserViewModel.themes){ theme in
                    NavigationLink(
                        destination: EmojiMemoryGameView(emojiGameVM: EmojiMemoryGame(theme: theme))) {
                        ThemeCell(theme: theme)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Themes")
            .navigationBarItems(
                trailing:
                    Button(action: {
                        
                    }, label: {
                        Text("+ Theme")
                    })
            )
        }
    }
}
struct ThemeCell: View {
    var themeVM: ThemeViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(themeVM.title)
                    .foregroundColor(themeVM.color)
                    .font(.title)
                Spacer()
                Text("\(themeVM.pairNumbers)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
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
        Group {
            ThemeChooserView(chooserViewModel: ThemeChooserViewModel())
            ThemeChooserView(chooserViewModel: ThemeChooserViewModel())
                .preferredColorScheme(.dark)
        }
    }
}

