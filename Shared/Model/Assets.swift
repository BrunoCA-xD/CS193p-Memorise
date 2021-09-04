import Foundation

enum Assets {
    enum CardImages {
        
        enum Halloween: String, CaseIterable {
            case chucky,
                 freddy,
                 jason,
                 myers,
                 saw,
                 ghostface,
                 lycan,
                 vampire,
                 frankenstein
            
            var name: String {
                return "halloween.\(self.rawValue)"
            }
        }
        
        enum Comedians: String, CaseIterable {
            case afonsoPadilha,
                 thiagoVentura,
                 muriloCouto,
                 nilAgra,
                 renatoAlbani,
                 tataWerneck,
                 joaoPimenta,
                 brunaBraga
            
            var name: String {
                return "comedians.\(self.rawValue)"
            }
        }
        
        enum GreekMitic: String, CaseIterable {
            case minotaur,
                 cerberus,
                 jellyfish,
                 cyclops,
                 hydra,
                 poseidon,
                 quimera,
                 zeus
            
            var name: String {
                return "greekMitic.\(self.rawValue)"
            }
        }
        
        enum Villains: String, CaseIterable {
            case joker,
                 darkseid,
                 brainiac,
                 apocalypse
            
            var name: String {
                "villains.\(self.rawValue)"
            }
        }
    }
    
    enum CardColors: String {
        case halloween,
             comedians,
             greekMitic,
             villains
        
        
        var name: String {
            return "\(self.rawValue).card"
        }
    }
}

