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
                 brunaBraga,
                 denisonCarvalho
            
            var name: String {
                return "comedians.\(self.rawValue)"
            }
        }
        
        enum GreekMitic: String, CaseIterable {
            case minotaur,
                 cerberus,
                 jellyfish,
                 cyclops,
                 harpia,
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
                 apocalypse,
                 drdoom,
                 sinestro,
                 galactus,
                 modok,
                 magneto,
                 greenGoblin
            
            
            var name: String {
                "villains.\(self.rawValue)"
            }
        }
        
        enum NostalgicGames: String, CaseIterable {
            case megaman,
                 crash,
                 sonic,
                 mario,
                 dk,
                 pokemon,
                 pacman,
                 rayman,
                 ryu
            
            
            var name: String {
                "nostalgicGames.\(self.rawValue)"
            }
        }
    }
    
    enum CardColors: String {
        case halloween,
             comedians,
             greekMitic,
             villains,
             nostalgicGames
        
        
        var name: String {
            return "\(self.rawValue).card"
        }
    }
    
    enum CardIllustrations: String {
        case halloween,
             comedians
        
        var name: String {
            return "\(self.rawValue).illustration"
        }
    }
}

