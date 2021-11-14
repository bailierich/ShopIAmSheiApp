//
//  InputTextField.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/6/21.
//

import SwiftUI

struct InputTextField: View {

    
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let fontSize: CGFloat
    let maxWidthDecimal: Double
    let deviderSize: CGFloat
    
    private let textFieldLeading: CGFloat = 30
    
    
    
    var body: some View {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        VStack{
            
            TextField(placeholder, text: $text)
            .frame(maxWidth: screenWidth * maxWidthDecimal, minHeight: 22)
            .padding(.leading,
                     textFieldLeading)
            .keyboardType(keyboardType)
            .font(.custom("coolvetica", size: fontSize))
            .foregroundColor(.black)
            Divider().background(.black)
            .padding(.horizontal, deviderSize)
                
        
        }
    }


struct InputTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        
        InputTextField(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, fontSize: 30, maxWidthDecimal: 0.9, deviderSize: 30)
            .preview(with: "text input")
    }
}
}
