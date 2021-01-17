//
//  UserView.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import SwiftUI
import PureSwiftUI

struct UserView: View {
    @State private var counter = 20
    @State private var editing = false
    @State private var change = 0
    
    @State private var timer: Timer?
    
    var color: Color = .mtgMountain
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                    
                Text("-")
                    .greedyFrame()
                    .fontSize(50)
                    .opacity(0.2)
                    .backgroundColor(color)
                    .onTapGesture {
                        addToCounter(-1)
                    }
                    
                Text("+")
                    .greedyFrame()
                    .fontSize(50)
                    .opacity(0.2)
                    .backgroundColor(color)
                    .onTapGesture {
                        addToCounter(1)
                    }
                    
            }
            ZStack {
                Text(String(counter + change))
                    .fontSize(140)
                RenderIf(editing) {
                    Text("\(change > 0 ? "+" : "")\(change)")
                        .fontSize(60)
                        .opacity(0.6)
                        .yOffset(-120)
                }
            }
        }
        
    }
    
    private func addToCounter(_ value: Int) {
        editing = true
        change += value
        
        if let timer = timer {
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { timer in
            counter += change
            change = 0
            editing = false
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
