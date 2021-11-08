//
//  SignUpView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/5/21.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        
        NavigationView{
            
        VStack{
            
        VStack(alignment: .leading){
          
            if screenHeight <= 737{

            Text("Hello New Client")
                    .font(.custom("coolvetica", size: 50))
            Text("Let's Get You Registered")
                    .font(.custom("coolvetica", size: 25))
                    .foregroundColor(Color("steelteal"))
                    .padding(.bottom, 10)
                
               
            } else
            {
                
                Text("Hello New Client")
                        .font(.custom("coolvetica", size: 55))
                Text("Let's Get You Registered")
                        .font(.custom("coolvetica", size: 30))
                        .foregroundColor(Color("steelteal"))
                        .padding(.bottom, 40)
            }
        }
                
            
                    VStack{
                        if screenHeight <= 737 {
                            
                            InputTextField(text: .constant(""), placeholder: "First Name", keyboardType: .namePhonePad)
                                .padding(.bottom, 5)
                            InputTextField(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
                                .padding(.bottom, 5)
                            InputTextField(text: .constant(""), placeholder: "Phone Number", keyboardType: .phonePad)
                                .padding(.bottom, 5)
                            PasswordInputView(password: .constant(""), placeholder: "Password")
                                .padding(.bottom, 5)
                            PasswordInputView(password: .constant(""), placeholder: "Confirm Password")
                                .padding(.bottom, 15)
                            
                            
                        }
                        
                        else{
                
                
                            InputTextField(text: .constant(""), placeholder: "First Name", keyboardType: .namePhonePad)
                    .padding(.bottom, 15)
                            InputTextField(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress)
                    .padding(.bottom, 15)
                            InputTextField(text: .constant(""), placeholder: "Phone Number", keyboardType: .phonePad)
                    .padding(.bottom, 15)
                            PasswordInputView(password: .constant(""), placeholder: "Password")
                    .padding(.bottom, 15)
                            PasswordInputView(password: .constant(""), placeholder: "Confirm Password")
                    .padding(.bottom, 45)
                        }
            }
            
            VStack{
                ButtonView(title: "Sign Up") {
                    //TO DO Write Code for Sign Up
                }
                
            }
    }
}
        .navigationBarHidden(true)
    }

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
}
