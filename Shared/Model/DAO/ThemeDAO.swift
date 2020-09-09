//
//  ThemeDAO.swift
//  iOS
//
//  Created by Bruno Cardoso Ambrosio on 08/09/20.
//

import Foundation

struct ThemeDAO {
    
    private let listKey = "themes"
    
    func save(themes list: [Theme]) {
//        let dictionary: Dictionary<String, [Theme]> = ["themes": list]
        let listAsData = list.compactMap { element -> Data? in
            element.json
        }
        UserDefaults.standard.set(listAsData, forKey: listKey)
    }
    
    
    func listAll() -> [Theme] {
        var list: [Theme] = []
        if let dataList = UserDefaults.standard.value(forKey: listKey) as? [Data] {
            list = dataList.compactMap { data -> Theme? in
                Theme(json: data)
            }
        }
        return list
    }
    
}
