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
    
    @State private var isWhoStartVisible = false
    
    var body: some View {
        HStack(spacing: 30) {
            ButtonView(symbolName: .arrow_2_squarepath, action: {
                game.resetLives()
            })
            ButtonView(symbolName: .person_fill_questionmark, action: {
                game.setIntoEditingMode()
            })
            ButtonView(symbolName: .list_number, action: {
                isWhoStartVisible = true
            })
            .alert(isPresented: $isWhoStartVisible, content: {
                Alert(title: Text("Empieza el jugador \(game.whoBegins() + 1 )"))
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
