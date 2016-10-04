//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by Marie Park on 10/2/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//
//Make handscore a calculated property that evaluates the cards array. It may use one Ace as a value of 11 if doing so will not bust the hand.

import Foundation

class Player {
    var name: String = ""
    var cards: [Card] = []
    var handscore: UInt {
        //evaluate cards array
        //return private function
        return calculateHandscore()
    }
    
    var blackjack: Bool {
        return cards.count == 2 && handscore == 21
        }
    
    var busted: Bool {
        return handscore > 21
        }
    
    var stayed: Bool = false
    
    var mayHit: Bool {
        if !busted && !blackjack && !stayed {
            return true
        } else {
            return false
        }
    }
    
    var tokens: UInt = 100
    var description: String {
        return "player: \(name)\ncards: \(Card())\nhandscore: \(handscore)\nblackjack: \(blackjack)\nbusted: \(blackjack)\n busted: \(busted)\n stayed\(stayed)\n mayHit: \(mayHit)\ntokens: \(tokens)\n"
    }
        
    init(name: String) {
        self.name = name
    }
    
    func canPlace(_ betValue:UInt) -> Bool {
        return tokens >= betValue
    }
    
    func didWin(_ betValue:UInt) {
        return tokens += betValue
    }
    
    func didLose(_ betValue:UInt) {
        return tokens -= betValue
    }

    func calculateHandscore() -> UInt {
        var aceCount = 0
        var score: UInt = 0
    
        for card in cards {
            
            if card.rank == "A" {
                aceCount += 1
                continue
            } else {
                score += card.cardValue
            }
            
            if aceCount == 2 {
                if score + 1 + 11 <= 21 {
                    score += 12
                } else {
                    score += 2
                }
            } else if aceCount == 1 {
                    if score + 11 <= 21 {
                        score += 11
                    } else {
                        score += 1
                    }
            }
        }
        return UInt(score)
    }
}
