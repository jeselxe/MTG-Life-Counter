//
//  ActionsView.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 30/1/21.
//

import SwiftUI
import PureSwiftUI

struct Actions: View {
    
    @EnvironmentObject var game: Game
    
    @Binding var isVisible: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            ButtonView(symbolName: .repeat, action: {
                game.users.forEach{ $0.lifes = game.lifes }
            })
            ButtonView(symbolName: .restart, action: {
                game.users.forEach{ $0.editing = true }
            })
            ButtonView(symbolName: .xmark, action: {
                withAnimation {
                    isVisible.toggle()
                }
            })
        }
    }
}

struct ActionsView_Previews: PreviewProvider {
    
    struct ActionsViewContainer: View {
        @State var isVisible = true
        var body : some View {
            Actions(isVisible: $isVisible)
        }
    }
    
    static var previews: some View {
        ActionsViewContainer()
            .environmentObject(Game())
    }
}
