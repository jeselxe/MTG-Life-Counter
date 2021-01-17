//
//  ContentView.swift
//  Shared
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import SwiftUI
import PureSwiftUI

struct ContentView: View {
    @State private var isHeaderVisible = false
    
    @State private var user1 = User(color: .mtgMountain, lifes: 20)
    @State private var user2 = User(color: .mtgIsland, lifes: 20)
    
    var body: some View {
        ZStack {
            VStack(spacing: isHeaderVisible ? 40 : 0) {
                UserView(user: $user1)
                    .rotate(180.degree)
                
                UserView(user: $user2)
            }
            RenderIf(isHeaderVisible) {
                HStack(spacing: 30) {
                    Button(action: restart) {
                        SFSymbol(.repeat)
                            .foregroundColor(.black)
                            .padding(5)
                            .backgroundColor(.white)
                            .clipCircleWithStroke(.black, lineWidth: 2)
                    }
                    Button(action: {
                        user1.editing = true
                        user2.editing = true
                    }) {
                        SFSymbol(.restart)
                            .foregroundColor(.black)
                            .padding(5)
                            .backgroundColor(.white)
                            .clipCircleWithStroke(.black, lineWidth: 2)
                    }
                    Button(action: configure) {
                        SFSymbol(.return)
                            .foregroundColor(.black)
                            .padding(5)
                            .backgroundColor(.white)
                            .clipCircleWithStroke(.black, lineWidth: 2)
                    }
                }
            }.elseRender {
                Button(action: configure) {
                    SFSymbol(.hammer)
                        .foregroundColor(.black)
                        .padding(5)
                        .backgroundColor(.white)
                        .clipCircleWithStroke(.black, lineWidth: 2)
                }
            }
        }.ignoresSafeArea()
    }
    
    private func configure() {
        withAnimation {
            isHeaderVisible.toggle()
        }
    }
    
    private func restart() {
        user2.lifes = 20
        user1.lifes = 20
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
