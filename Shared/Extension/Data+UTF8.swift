//
//  Data+UTF8.swift
//  Memorize
//
//  Created by Bruno Cardoso Ambrosio on 20/08/20.
//

import Foundation

extension Data {
    // just a simple converter from a Data to a String
    var utf8: String? { String(data: self, encoding: .utf8 ) }
}
