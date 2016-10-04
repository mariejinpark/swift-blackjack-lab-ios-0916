//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by Marie Park on 10/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    let suit: String
    let rank: String
    var cardLabel: String {
      return suit + rank
    }
    
    var cardValue: UInt {
        switch rank {
        case "A":
            return 1
        case "2":
            return 2
        case "3":
            return 3
        case "4":
            return 4
        case "5":
            return 5
        case "6":
            return 6
        case "7":
            return 7
        case "8":
            return 8
        case "9":
            return 9
        case "10":
            return 10
            //face cards are default 
        
        default:
            return 10
        }
    }
    
    var description: String {
        return cardLabel
    }
    
    init(suit: String, rank: String) {
        self.suit = suit
        self.rank = rank
    }
    
    init() {
       suit = ""
       rank = ""
    }
    
    func validSuits() -> [String] {
        return ["♠︎", "♥︎", "♦︎", "♣︎"]
    }
    
    func validRanks() -> [String] {
        return ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    }
    
    func determineCardValue(_ rank:String) -> UInt {
        return cardValue
    }
    
    //func createCardValue() -> UInt {
    
   // switch rank {
    // case "A": 
    //return 1
    //case "K", "Q", "j": 
    //return 10
    //default:
    //return UInt(rank)!
    
    //create instance of card: let newCard = Card(suit:String, rank:String)
    //only an instance of a card can call on the function 
    }











