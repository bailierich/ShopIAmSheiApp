//
//  SignInView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/5/21.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @State private var isShowingForgotPasswordView = false
    @State private var isShowingSignUpView = false
    
    var body: some View {
        
        ZStack{
            
            Image("LoginScreenBG")
        
        VStack{
            
        VStack(alignment: .leading){
            
        
            Text("Welcome Back Babe")
                .font(.custom("coolvetica", size: 40))
            
        
            Text("Login To You Acccount")
                .font(.custom("coolvetica", size: 21))
                .foregroundColor(Color("steelteal"))
            
    }
            
            Spacer().frame(minHeight: 40, maxHeight: 50)
            
            VStack(spacing: 10){
                
            
                InputTextField(text: .constant(""),
                           placeholder: "Email",
                           keyboardType: .emailAddress)
            
                PasswordInputView(password: .constant(""), placeholder: "Password")
                
            HStack{
                
                Spacer().frame(minWidth: 50, maxWidth: 180)
                
                NavigationLink(destination: ForgotPasswordView(), isActive: $isShowingForgotPasswordView){}
                Button(action: {isShowingForgotPasswordView = true})
                {
                    Text("Forgot Your Password?")
                        .font(Font.custom("Coolvetica",size: 18))
                        .foregroundColor(Color("steelteal"))
                    
                }
            }
            
            Spacer().frame(minHeight: 10, maxHeight: 20)
                VStack{
           
                    ButtonView(title: "Login") {
                //TODO add code for login
            }
                    NavigationLink(destination: SignInView(), isActive: $isShowingSignUpView){}
                    Button(action: {isShowingSignUpView = true})
                    {
                        Text("Don't Have An Account? Sign Up")
                            .font(Font.custom("Coolvetica",size: 18))
                            .foregroundColor(Color("steelteal"))
                        
                    }
                }
                
        }
            
            .navigationBarBackButtonHidden(true)
}
            
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
}
