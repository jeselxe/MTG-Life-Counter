//
//  UserView.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import SwiftUI
import PureSwiftUI

struct UserView: View {
    @Binding var user: User
    
    @State private var updatingLifes = false
    @State private var change = 0
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                    
                Text("-")
                    .greedyFrame()
                    .fontSize(50)
                    .opacity(0.2)
                    .backgroundColor(user.color)
                    .onTapGesture {
                        addToCounter(-1)
                    }
                    
                Text("+")
                    .greedyFrame()
                    .fontSize(50)
                    .opacity(0.2)
                    .backgroundColor(user.color)
                    .onTapGesture {
                        addToCounter(1)
                    }
                    
            }
            Text(String(user.lifes + change))
                .fontSize(140)
            RenderIf(updatingLifes) {
                Text("\(change > 0 ? "+" : "")\(change)")
                    .fontSize(60)
                    .opacity(0.6)
                    .yOffset(-120)
            }
            RenderIf(user.editing) {
                ColorSelectionView(onSelected: {color in
                    user.color = color
                    user.editing = false
                })
            }
        }
    }
    
    private func addToCounter(_ value: Int) {
        updatingLifes = true
        change += value
        
        if let timer = timer {
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            user.lifes += change
            change = 0
            updatingLifes = false
        }
    }
}

struct UserView_Previews: PreviewProvider {
    struct UserViewContainer: View {
        @State private var user = User(color: .mtgForest, lifes: 20)
        var body: some View {
            UserView(user: $user)
        }
    }
    static var previews: some View {
        UserViewContainer()
    }
}
