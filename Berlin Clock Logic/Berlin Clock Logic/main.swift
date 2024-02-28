//
//  main.swift
//  Berlin Clock Logic
//
//  Created by Schannikov Timothy on 28.02.2024.
//

import Foundation

class Clock{
    var hours: Int = 0
    var minutes: Int = 0
    var seconds: Int = 0
    
    
    var secondsLamp: String {
        return seconds % 2 == 0 ? "Y" : "O"
    }
    
    var fourHoursRaw: String {
        switch hours / 5 {
        case 0: return "OOOO"
        case 1: return "ROOO"
        case 2: return "RROO"
        case 3: return "RRRO"
        case 4: return "RRRR"
        
        default:
            return "Well how does that happen?"
        }
    }
    
    var singleHoursRaw: String {
        switch hours % 5 {
        case 0: return "OOOO"
        case 1: return "ROOO"
        case 2: return "RROO"
        case 3: return "RRRO"
        case 4: return "RRRR"
        
        default:
            return "Well how does that happen?"
        }
    }
    
    var fiveMinutesRaw: String {
        switch minutes / 5 {
        case 0: return "OOOOOOOOOOO"
        case 1: return "YOOOOOOOOOO"
        case 2: return "YYOOOOOOOOO"
        case 3: return "YYROOOOOOOO"
        case 4: return "YYRYOOOOOOO"
        case 5: return "YYRYYOOOOOO"
        case 6: return "YYRYYROOOOO"
        case 7: return "YYRYYRYOOOO"
        case 8: return "YYRYYRYYOOO"
        case 9: return "YYRYYRYYROO"
        case 10: return "YYRYYRYYRYO"
        case 11: return "YYRYYRYYRYY"
        
        default:
            return "Well how does that happen?"
        }
    }
    
    var singleMinutesRaw: String {
        switch minutes % 5 {
        case 0: return "OOOO"
        case 1: return "YOOO"
        case 2: return "YYOO"
        case 3: return "YYYO"
        case 4: return "YYYY"
        
        default:
            return "Well how does that happen?"
        }
    }
    
    func convertTimeToBerlin(time: String) -> String {
        var modifiedTime = time
            
            let components = modifiedTime.components(separatedBy: ".")
        if components.count != 3 {
            return "Invalid value format"
        }
        
           var firstZero = false
           var secondZero = false
            
            if components[0].first == "0" {
                modifiedTime.remove(at: modifiedTime.startIndex)
                firstZero = true
            }
        
            if components[1].first == "0" {
                if(firstZero){
                    modifiedTime.remove(at: modifiedTime.index(modifiedTime.startIndex, offsetBy: 2))
                }
                else{
                    modifiedTime.remove(at: modifiedTime.index(modifiedTime.startIndex, offsetBy: 3))
                }
                secondZero = true
            }
        
            if components[2].first == "0" {
                if(firstZero == true && secondZero == true){
                    modifiedTime.remove(at: modifiedTime.index(modifiedTime.startIndex, offsetBy: 4))
                }
                if(firstZero == true || secondZero == true){
                    modifiedTime.remove(at: modifiedTime.index(modifiedTime.startIndex, offsetBy: 5))
                }
                else{
                    modifiedTime.remove(at: modifiedTime.index(modifiedTime.startIndex, offsetBy: 6))
                }
            }
            
            guard let hours = Int(components[0]),
                  let minutes = Int(components[1]),
                  let seconds = Int(components[2]) else {
                print("Invalid value format")
                return ""
            }
    
        return ("\(secondsLamp)\(fourHoursRaw)\(singleHoursRaw)\(fiveMinutesRaw)\(singleMinutesRaw)")
    }
    
}

let myClock = Clock()
print("Enter time in 00.00.00 format")
print (myClock.convertTimeToBerlin(time: readLine() ?? "00.00.00"))

// Нуу вот так как то
// Я пытался красиво но под конец малек запутался намудрил...
// Но зато работает



