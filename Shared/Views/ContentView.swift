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
    
    @EnvironmentObject var game: Game
    
    var body: some View {
        ZStack {
            VStack(spacing: isHeaderVisible ? 50 : 0) {
                ForEach(game.users.indices) { idx in
                    let user = game.users[idx]
                    UserView(user: user)
                        .rotate(idx % 2 == 0 ? 180.degree : 0.degree)
                }
            }
            RenderIf(isHeaderVisible) {
                Actions(isVisible: $isHeaderVisible)
            }.elseRender {
                ButtonView(symbolName: .slider_horizontal_3,action: configure)
            }
        }.ignoresSafeArea()
    }
    
    private func configure() {
        withAnimation {
            isHeaderVisible.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice(.iPhone_8)
                .environmentObject(Game())
            ContentView()
                .preferredColorScheme(.dark)
                .previewDevice(.iPhone_8)
                .environmentObject(Game())
        }
    }
}
