//
//  Array+Extension.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 03/07/20.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching element: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}

extension Array {

    var only: Element? {
        count == 1 ? first : nil
    }
}
