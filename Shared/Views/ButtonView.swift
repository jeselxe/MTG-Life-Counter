//
//  ButtonView.swift
//  MTG Counter
//
//  Created by Jesús Gallego Irles on 30/1/21.
//

import SwiftUI
import PureSwiftUI

struct ButtonView: View {
    
    let symbolName: SFSymbolName
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            SFSymbol(symbolName)
                .foregroundColor(Color("DarkColor"))
                .padding(10)
                .background(Color("LightColor"))
                .clipCircleWithStroke(Color("DarkColor"), lineWidth: 2)
            
        }
        
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(symbolName: .apps_iphone, action: {})
        ButtonView(symbolName: .apps_iphone, action: {})
            .preferredColorScheme(.dark)
            
    }
}
