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
    
    private let textFieldLeading: CGFloat = 30
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        
        VStack{
        
        SecureField(placeholder, text: $password)
            .frame(maxWidth: screenWidth * 0.9, minHeight: 44)
            .padding(.leading,
                     textFieldLeading)
            .font(.custom("coolvetica", size: 30))
            .foregroundColor(.black)
            Divider().background(.black)
            .padding(.horizontal, 30)
                
    }
}

struct PasswordInputView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordInputView(password: .constant(""), placeholder: "Password")
            .preview(with: "password input field ")
    }
}
}
