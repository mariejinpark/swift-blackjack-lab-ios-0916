//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by Marie Park on 10/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var dealtCards: [Card]
    private var undealtCards: [Card]
    //private properties cannot be accessed or called on outside of the class ?

    var description: String {
        return "Cards Remaining: \(undealtCards.count), Cards Dealt: \(dealtCards.count)"
    }
    
    init() {
        dealtCards = []
        undealtCards = []
        
        //create 52 deck cards
        for suit in Card().validSuits() {
            //print("Rank is \(rank)")
            //print("Within rank for loop, suit is \(suit)")
            //print ("========================") // to distinguish between for loops
            for rank in Card().validRanks() {
                 //print("Suit is \(suit)") to test
                //print ("========================") // to distinguish between for loops
                undealtCards.append(Card(suit: suit, rank: rank))
            }
        }
        
        for card in undealtCards{
            print(card.cardLabel)
        }
    }

    func drawCard() -> Card {
        let topCard = undealtCards.removeLast()
        dealtCards.append(topCard)
        return topCard
    }
    
    func shuffle() {
        for card in dealtCards {
            undealtCards.append(card)
        }
        for i in 0..<(undealtCards.count-1) {
            let randomIndex = Int(arc4random_uniform(UInt32(undealtCards.count - i))) + i
            if i != randomIndex {
                swap(&undealtCards[i], &undealtCards[randomIndex])
            }
        }
    }
}
