//
//  Theme.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import Foundation
import UIKit.UIColor

struct Theme: Identifiable, Codable {
    var id: Int
    var title: String
    var symbols: [String]
    var numberOfPair: Int
    var colors: [UIColor.RGB]
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
}


let builtInThemes = [
    Theme(id: 1, title: "Faces", symbols: ["😀","😃","😄","😊","🥰","😇","🤪","🥶"],
          numberOfPair: 8,
          colors: [UIColor.RGB(.yellow)]),
    Theme(id: 2, title: "Flags", symbols: ["🇧🇷","🇮🇴","🇨🇦","🇪🇺","🇬🇳"],
          numberOfPair: 5,
          colors: [
            UIColor.RGB(.red),
            UIColor.RGB(.blue)]),
    Theme(id: 3, title: "Food", symbols: ["🍎","🍓","🌭","🍕","🎂","🍫","🍮"],
          numberOfPair: 7,
          colors: [
            UIColor.RGB(.red),
            UIColor.RGB(.yellow),
            UIColor.RGB(.orange)]),
    Theme(id: 4, title: "Halloween", symbols: ["👻","🎃","🕷","💀","👺"],
          numberOfPair: 5,
          colors: [UIColor.RGB(.orange)]),
    Theme(id: 5, title: "Places", symbols: ["🏬","🏥","🏨","🕍","🏭"],
          numberOfPair: 5,
          colors: [UIColor.RGB(.gray)]),
    Theme(id: 6, title: "Vehicles", symbols: ["🚗","🚔","🚎","🚓","🏍","🚑","🚒","🚛"],
          numberOfPair: 8,
          colors: [UIColor.RGB(.blue)]),
    
]
