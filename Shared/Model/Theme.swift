//
//  Theme.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import Foundation
import UIKit.UIColor

struct Theme: Identifiable, Codable {
    var id: String
    var title: String
    var symbols: [String]
    var numberOfPair: Int
    var colors: [UIColor.RGB]
    
    var json: Data? {
        return try? JSONEncoder().encode(self)
    }
    
    init?(json: Data?) {
        if json != nil, let new = try? JSONDecoder().decode(Theme.self, from: json!){
            self = new
        }else {
            return nil
        }
    }
    
    init(id: String = UUID().uuidString, title: String, symbols: [String] = [], numberOfPair: Int, colors: [UIColor.RGB]) {
        self.id = id
        self.title = title
        self.symbols = symbols
        self.numberOfPair = numberOfPair
        self.colors = colors
    }
    
}


let builtInThemes = [
    Theme(title: "Faces", symbols: ["😀","😃","😄","😊","🥰","😇","🤪","🥶"],
          numberOfPair: 7,
          colors: [UIColor.RGB(.yellow)]),
    Theme(title: "Flags", symbols: ["🇧🇷","🇮🇴","🇨🇦","🇪🇺","🇬🇳"],
          numberOfPair: 5,
          colors: [
            UIColor.RGB(.red),
            UIColor.RGB(.blue)]),
    Theme(title: "Food", symbols: ["🍎","🍓","🌭","🍕","🎂","🍫","🍮"],
          numberOfPair: 7,
          colors: [
            UIColor.RGB(.red),
            UIColor.RGB(.yellow),
            UIColor.RGB(.orange)]),
    Theme(title: "Halloween", symbols: ["👻","🎃","🕷","💀","👺"],
          numberOfPair: 5,
          colors: [UIColor.RGB(.orange)]),
    Theme(title: "Places", symbols: ["🏬","🏥","🏨","🕍","🏭"],
          numberOfPair: 5,
          colors: [UIColor.RGB(.gray)]),
    Theme(title: "Vehicles", symbols: ["🚗","🚔","🚎","🚓","🏍","🚑","🚒","🚛"],
          numberOfPair: 6,
          colors: [UIColor.RGB(.blue)]),
    
]
