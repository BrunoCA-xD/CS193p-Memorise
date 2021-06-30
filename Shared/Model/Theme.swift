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
    Theme(id: 1, title: "Halloween", symbols: [
            "halloween.jason",
            "halloween.ghostface",
            "halloween.saw",
            "halloween.jason",
            "halloween.jason",
            "halloween.jason",
            "halloween.jason",
            "halloween.jason",
            "halloween.jason",
    ]),
    Theme(id: 2, title: "Comediantes", symbols: [
            "comediantes.afonso",
            "comediantes.afonso",
            "comediantes.afonso",
            "comediantes.afonso",
            "comediantes.afonso",
            "comediantes.afonso",
            "halloween.jason",
            "halloween.jason",
            "halloween.jason",
    ])
]
