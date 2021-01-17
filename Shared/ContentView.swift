//
//  ContentView.swift
//  Shared
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import SwiftUI
import PureSwiftUI

struct ContentView: View {
    @State private var editing = false
    @State private var selectingColor = false
    @State private var color1: Color = .mtgMountain
    @State private var color2: Color = .mtgIsland
    
    var body: some View {
        ZStack {
            VStack(spacing: editing ? 40 : 0) {
                UserView(color: color1)
                    .rotate(180.degree)
                
                UserView(color: color2)
            }
            RenderIf(editing) {
                HStack {
                    Button(action: restart) {
                        SFSymbol(.repeat)
                            .foregroundColor(.black)
                            .padding(5)
                            .backgroundColor(.white)
                            .clipCircleWithStroke(.black, lineWidth: 2)
                    }
                    Button(action: {
                        selectingColor = true
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
            RenderIf(selectingColor) {
                VStack(spacing: 0) {
                    ColorSelectionView(onSelected: { color in
                        color1 = color
                        selectingColor = false
                    })
                        .rotate(180.degree)
                    ColorSelectionView(onSelected: { color in
                        color2 = color
                        selectingColor = false
                    })
                }
            }
        }.ignoresSafeArea()
    }
    
    private func configure() {
        withAnimation {
            editing.toggle()
        }
    }
    
    private func restart() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
