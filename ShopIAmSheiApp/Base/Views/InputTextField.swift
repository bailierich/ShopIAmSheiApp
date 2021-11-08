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
    
    
    private let textFieldLeading: CGFloat = 30
    
    
    
    var body: some View {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        VStack{
            
            TextField(placeholder, text: $text)
            .frame(maxWidth: screenWidth * 0.9, minHeight: 44)
            .padding(.leading,
                     textFieldLeading)
            .keyboardType(keyboardType)
            .font(.custom("coolvetica", size: 30))
            .foregroundColor(.black)
            Divider().background(.black)
            .padding(.horizontal, 30)
                
        
        }
    }


struct InputTextField_Previews: PreviewProvider {
    
    static var previews: some View {
        
        InputTextField(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
            .preview(with: "text input")
    }
}
}
