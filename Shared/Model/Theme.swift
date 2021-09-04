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
    var color: String? = nil
    var backIllustration: String? = nil
}

let builtInThemes = [
    Theme(
        id: 1,
        title: "Halloween",
        symbols: Assets.CardImages.Halloween.allCases.map{ $0.name },
        color: Assets.CardColors.halloween.name
    ),
    Theme(
        id: 2,
        title: "Comediantes",
        symbols: Assets.CardImages.Comedians.allCases.map{ $0.name },
        color: Assets.CardColors.comedians.name
    ),
    Theme(
        id: 3,
        title: "Mitologia Grega",
        symbols: Assets.CardImages.GreekMitic.allCases.map{ $0.name },
        color: Assets.CardColors.greekMitic.name
    ),
    Theme(
        id: 4,
        title: "Vilões",
        symbols: Assets.CardImages.Villains.allCases.map{ $0.name },
        backIllustration: Assets.CardImages.Halloween.lycan.name
    )
]
