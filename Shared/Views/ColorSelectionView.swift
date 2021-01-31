//
//  ColorSelectionView.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 17/1/21.
//

import SwiftUI

struct ColorSelectionView: View {
    var onSelected: (_ selected: Color) -> Void
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 40) {
                Image("R").resizedToFit(80).onTapGesture {
                    onSelected(.mtgMountain)
                }
                Image("U").resizedToFit(80).onTapGesture {
                    onSelected(.mtgIsland)
                }
                Image("G").resizedToFit(80).onTapGesture {
                    onSelected(.mtgForest)
                }
            }
            HStack(spacing: 40) {
                Image("W").resizedToFit(80).onTapGesture {
                    onSelected(.mtgPlains)
                }
                Image("B").resizedToFit(80).onTapGesture {
                    onSelected(.mtgSwamp)
                }
            }
        }.greedyFrame().backgroundColor(Color.black.opacity(0.2))
    }
}

// MARK: - MTG Colors

extension Color {
    static let mtgPlains = Color(red: 248/255, green: 231/255, blue: 185/255)
    static let mtgForest = Color(red: 196/255, green: 211/255, blue: 202/255)
    static let mtgIsland = Color(red: 179/255, green: 206/255, blue: 234/255)
    static let mtgMountain = Color(red: 235/255, green: 159/255, blue: 130/255)
    static let mtgSwamp = Color(red: 166/255, green: 159/255, blue: 157/255)
}

struct ColorSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelectionView(onSelected: {color in
            
        })
    }
}
