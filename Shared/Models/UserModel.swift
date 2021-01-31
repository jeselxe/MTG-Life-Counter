//
//  UserModel.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import Foundation
import SwiftUI

class User: ObservableObject, Identifiable {
    var color: Color = .mtgMountain
    @Published var lifes: Int = 20
    @Published var editing: Bool = false
    
    let id = UUID()
    
    init(color: Color = .mtgMountain) {
        self.color = color
    }
}
