//
//  PasswordInputView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/7/21.
//

import SwiftUI

struct PasswordInputView: View {
    
    @Binding var password: String
    let placeholder: String
    let fontSize: CGFloat
    private let textFieldLeading: CGFloat = 30
    let fieldSize: CGFloat
    let deviderSize: CGFloat
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        VStack{
        
        SecureField(placeholder, text: $password)
            .frame(maxWidth: screenWidth * 0.9, minHeight: fieldSize)
            .padding(.leading,
                     textFieldLeading)
            .font(.custom("coolvetica", size: fontSize))
            .foregroundColor(.black)
            Divider().background(.black)
            .padding(.horizontal, deviderSize)
                
    }
}

struct PasswordInputView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordInputView(password: .constant(""), placeholder: "Password", fontSize: 30, fieldSize: 22, deviderSize: 30)
            .preview(with: "password input field ")
    }
}
}
