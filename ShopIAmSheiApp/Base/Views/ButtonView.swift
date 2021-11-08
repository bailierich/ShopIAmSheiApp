//
//  ButtonComponentView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/7/21.
//

import SwiftUI

struct ButtonView: View {
    
    
 
    
    
    typealias ActionHandler = () -> Void
    
    let title: String
    let backround: Color
    let foreground: Color
    let handler: ActionHandler
    
    private let cornerRadius: CGFloat = 30
    
    internal init(title: String,
                  backround: Color = Color("steelteal"),
                  foreground: Color = .white,
                  handler: @escaping
                  ButtonView.ActionHandler) {
        self.title = title
        self.backround = backround
        self.foreground = foreground
        self.handler = handler
    }
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width

        
        Button(action: handler, label: {
            Text(title)
                .frame(maxWidth: screenWidth * 0.9, minHeight: 60 )
                .font(Font.custom("Coolvetica",size: 30))
        })
            .background(backround)
            .foregroundColor(foreground)
            .font(.custom("coolvetica", size: 30))
            .cornerRadius(cornerRadius)
    }
}

struct ButtonComponentView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Primary"){ }
        .preview(with: "Primary Button")
        
        ButtonView(title: "Secondary", backround: .white, foreground: .black){ }
        .preview(with: "Secondary Button")
    }
}
