//
//  GameModel.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 30/1/21.
//

import Foundation
import SwiftUI

class Game: ObservableObject {
    let users: [User]
    let lifes: Int
    
    init() {
        self.users = [
            User(color: .mtgMountain),
            User(color: .mtgIsland)
        ]
        self.lifes = 20
    }
    
    func resetLives() {
        users.forEach{ $0.lifes = self.lifes }
    }
    
    func setIntoEditingMode() {
        users.forEach{ $0.editing = true }
    }
    
    func whoBegins() -> Int {
        Int.random(in: users.indices)
    }
    
}
