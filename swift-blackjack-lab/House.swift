//
//  House.swift
//  swift-blackjack-lab
//
//  Created by Marie Park on 10/3/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class House: Player {
    
    var mustHit: Bool {
        if handscore < 17 {
            return true
        } else {
            return false
        }
    }
    
    override init(name:String){
        super.init(name: name)
        tokens = 1000
    }
}
