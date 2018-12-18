//
//  View.swift
//  OC_RPG
//
//  Created by Kévin Courtois on 17/12/2018.
//  Copyright © 2018 Kévin Courtois. All rights reserved.
//

import Foundation

class View {
    //Static function to ask a name.
    //askPhrase is a parameter that helps the function to be less
    //repetitive when asking multiple names in a row.
    
    enum NameUsage {
        case Player, Character
    }
    
    static func askName(askPhrase:String, game:Game, whoFor:NameUsage) -> String {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        while !goOn {
            print(askPhrase)
            //Get input from the user
            if let userInput = readLine(){
                print("\n\(userInput), that's it ? (y/n)")
                if(View.isNameAvailable(name: userInput, game: game, whoFor: whoFor)){
                    //Ask confirmation
                    goOn = View.YesNoInput()
                }
                else{
                    print("\nNope, this name is not available !\n")
                    goOn = false
                }
            }
            else {
                print("\nHum... I guess i did not hear you well !\n")
                goOn = false
            }
        }
        return "error"
    }
    
    static func createCharacter(game:Game) -> Character {
        //GoOn is a bool used to keep asking the player name if we didn't get it correctly.
        var goOn:Bool = false
        var className:String = ""
        
        while !goOn {
            print("So what will you pick ?\n")
            print("1 - Fighter: The basic attacker. A good warrior ! 🤺\n")
            print("2 - Mage: His gift ? Heal his fellow partners ! 🧙‍♂️\n")
            print("3 - Colossus: Tough and mighty, but he will not hurt you. 🛡\n")
            print("4 - Dwarf: His axe will hit you hard, but his life bar is as short as his height. 🔪\n")
            //Get input from the user
            if let userInput = readLine(){
                switch userInput {
                    case "1":
                        className = "Fighter"
                        print("\n\(className), that's what you want ? \n")
                        //Ask confirmation
                        goOn = View.YesNoInput()
                    case "2":
                        className = "Mage"
                        print("\n\(className), that's what you want ? \n")
                        //Ask confirmation
                        goOn = View.YesNoInput()
                    case "3":
                        className = "Colossus"
                        print("\n\(className), that's what you want ? \n")
                        //Ask confirmation
                        goOn = View.YesNoInput()
                    case "4":
                        className = "Dwarf"
                        print("\n\(className), that's what you want ? \n")
                        //Ask confirmation
                        goOn = View.YesNoInput()
                    default:
                        print("\nNope, can't pick that. Try again ! \n")
                        goOn = false
                }
            }
            else {
                print("\nNope, can't pick that. Try again ! \n")
                goOn = false
            }
        }
        
        //Ask character's name
        let charName:String = View.askName(askPhrase: "What will be your character's name ?", game: game, whoFor: .Character)
        
        //Return the right character
        switch className {
            case "Fighter":
                return Fighter(name: charName)
            case "Mage":
                return Mage(name: charName)
            case "Colossus":
                return Colossus(name: charName)
            case "Dwarf":
                return Dwarf(name: charName)
            default:
                return Fighter(name: charName)
        }
        
    }
    
    //Static function to ask a the user to input yes or no. Returns a boolean.
    static func YesNoInput() -> Bool {
        if let yesNo = readLine(){
            //Confirmation switch
            switch yesNo {
            case "y","yes":
                print("\nAlright !\n")
                return true
            case "n","no":
                print("\nHum... I guess i did not hear you well !\n")
                return false
            default:
                print("\nHum... I guess i did not hear you well !\n")
                return false
            }
        }
        else{
            print("\nHum... I guess i did not hear you well !\n")
            return false
        }
    }
    //Test if the name given in param is used by a character in the game.
    static func isNameAvailable(name:String, game:Game, whoFor:NameUsage) -> Bool{
        if(whoFor == .Character){
            print("CHAAAAAAAAAAAAAR")
            //Runs through player1 team
            for char in game.player1.team {
                //If the name is taken by a character, return false (not available)
                if char.name.elementsEqual(name) {
                    return false
                }
            }
            //Runs through player2 team
            for char in game.player2.team {
                //If the name is taken by a character, return false (not available)
                if char.name.elementsEqual(name) {
                    return false
                }
            }
            //If the name wasn't found in any team, return true
            return true
        }
        else {
            //If the name is taken by a player, return false (not available)
            if (game.player1.name.elementsEqual(name) || game.player2.name.elementsEqual(name)) {
                return false
            }
            //If the name wasn't found in any team, return true
            return true
        }
    }
}
