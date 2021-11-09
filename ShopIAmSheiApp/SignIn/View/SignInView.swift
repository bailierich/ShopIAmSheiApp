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
    @State private var isLoggedin = false
    
    @State var email = ""
    @State var password = ""
    
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
                
            
                InputTextField(text: $email,
                           placeholder: "Email",
                           keyboardType: .emailAddress, fontSize: 30)
            
                PasswordInputView(password: $password, placeholder: "Password", fontSize: 30)
                
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

                    //Login User With FirebaseAuth and Go To Home Page
                    NavigationLink(destination: HomeView(), isActive: $isLoggedin){}
                    ButtonView(title: "Login") {
                        LoginUser()
                        
                        
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
                                      
private func LoginUser(){
    
    Auth.auth().signIn(withEmail: email, password: password) { result, err in
        if let err = err {
            print("Failed to Login User: ", err)
            return
        }
        else{
            
            print("Successfully Logged In User: \(result?.user.uid ?? "")")
            
        
                  
                  isLoggedin = true
        }
    }
                                    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
}
