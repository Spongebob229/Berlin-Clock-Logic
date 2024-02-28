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
    
    func toInt(component: String) -> Int{
        var string = component
        if (string.first == "0"){
            let i = string.index(string.startIndex, offsetBy: 0)
            let removed_String = String(string.remove(at: i))
            return Int(removed_String) ?? -1
        }
        
        return Int(string) ?? -1
    }
    
    func convertTimeToBerlin(time: String) -> String {
        
        let components = time.components(separatedBy: ".")
        
        if components.count != 3 {
            return "Invalid value format"
        }
        
        seconds = toInt(component: components[2])
        minutes = toInt(component: components[1])
        hours = toInt(component: components[0])
        
        if seconds > 59 || seconds < 0{
            return "Invalid value format"
        }
        if minutes > 59 || seconds < 0{
            return "Invalid value format"
        }
        if hours > 23 || seconds < 0{
            return "Invalid value format"
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



