//
//  Player.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class Player {
    //Player's name
    let name:String
    //Team will be the characters created by the player.
    var team:[Character]
    //Defines how many characters the player can create
    var maxCharInTeam:Int
    
    init(name:String) {
        self.name = name
        self.team = []
        self.maxCharInTeam = 3
    }
    
    //Returns a formated string with all the characters of the team, with their class and name.
    func printTeam() -> String {
        var output:String = ""
        for (index, char) in team.enumerated() {
            output += "\(index+1). \(char.printChar())\n"
        }
        return output
    }
    
    //Returns true if there is at least one character alive in the player's team
    func isAlive() -> Bool {
        var nbCharAlive:Int = 0
        for char in team {
            if char.isAlive {
                nbCharAlive += 1
            }
        }
        //If there is a character alive in the team, returns true
        return nbCharAlive > 0
    }
    
    //Checks if given number matches an index for team
    func isCharNumberValid(number:Int) -> Bool {
        return number-1 >= 0 && number-1 < team.count
    }
}
