//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by Marie Park on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck: Deck
    var house: House
    var player: House
    var bet: UInt

    init(deck:Deck, house: House, player: House, bet: UInt) {
        self.deck = deck
        self.house = house
        self.player = player
        self.bet = 0
    }
    
    func place(_ bet:UInt) -> Bool {
        if house.canPlace(bet) && player.canPlace(bet) {
            print(bet)
        }
        return true
    }

    func deal() {
        house.stayed = false
        player.stayed = false
        house.cards.removeAll()
        player.cards.removeAll()
        
        var i = 2
        while i > 0 {
            player.cards.append(deck.drawCard())
            house.cards.append(deck.drawCard())
            i -= 1
        }
    }
    
    func turn(_house:House) -> String {
        if house.mayHit == true {
            print("Do you wish you hit or stay?")
            if house.mustHit == true {
                 house.cards.append(deck.drawCard())
            } else if house.stayed == true {
                return "Player stays"
            }
        }
        return ""
    }

    func winner() -> String {
        if house.busted || player.blackjack || player.handscore > house.handscore {
            return "player"
        } else if player.busted || house.blackjack || house.handscore >= player.handscore {
            return "house"
        } else {
            return "no"
        }
    }
    
    func award() -> String {
        if winner() == "player" {
            player.didWin(bet)
            house.didLose(bet)
        
        } else if winner() == "house" {
            house.didWin(bet)
            player.didLose(bet)
        }
        return "\(winner) wins!"
    }
    
}
