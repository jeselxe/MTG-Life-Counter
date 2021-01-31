//
//  MTG_CounterApp.swift
//  Shared
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import SwiftUI

@main
struct MTG_CounterApp: App {
    
    @StateObject var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(game)
        }
    }
}
