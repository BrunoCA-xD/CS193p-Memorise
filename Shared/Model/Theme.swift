//
//  Theme.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import Foundation

struct Theme: Identifiable {
    var id: Int
    var title: String
    var symbols: [String]
}

let builtInThemes = [
    Theme(id: 1, title: "Faces", symbols: ["😀","😃","😄","😊","🥰","😇","🤪","🥶"]),
    Theme(id: 2, title: "Flags", symbols: ["🇧🇷","🇮🇴","🇨🇦","🇪🇺","🇬🇳"]),
    Theme(id: 3, title: "Food", symbols: ["🍎","🍓","🌭","🍕","🎂","🍫","🍮"]),
    Theme(id: 4, title: "Halloween", symbols: ["👻","🎃","🕷","💀","👺"]),
    Theme(id: 5, title: "Places", symbols: ["🏬","🏥","🏨","🕍","🏭"]),
    Theme(id: 6, title: "Vehicles", symbols: ["🚗","🚔","🚎","🚓","🏍","🚑","🚒","🚛"]),
    
]
