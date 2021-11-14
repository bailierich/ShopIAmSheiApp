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
    
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    
    @State private var showAlert = false
    @State private var authError: EmailAuthError?
    
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
      
        let maxWidthDecimalSignInView = 0.9
        
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
                
                if screenHeight <= 737 {
                    InputTextField(text: self.$user.email,
                           placeholder: "Email",
                           keyboardType: .emailAddress, fontSize: 30
                               , maxWidthDecimal: maxWidthDecimalSignInView,deviderSize: 50)
            
                    PasswordInputView(password: self.$user.password, placeholder: "Password", fontSize: 30, fieldSize: 44, deviderSize: 50)
                }else{
                    InputTextField(text: self.$user.email,
                               placeholder: "Email",
                               keyboardType: .emailAddress, fontSize: 30
                                   , maxWidthDecimal: maxWidthDecimalSignInView,deviderSize: 30)
                
                    PasswordInputView(password: self.$user.password, placeholder: "Password", fontSize: 30, fieldSize: 44, deviderSize: 30)
                }
                
            HStack{
                
                Spacer().frame(minWidth: 50, maxWidth: 160)
                
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
                    NavigationLink(destination: SignUpView(), isActive: $isShowingSignUpView){}
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
    
    FBAuth.authenticate(withEmail: self.user.email,
                                            password: self.user.password) { (result) in
                                                switch result {
                                                case .failure(let error):
                                                    self.authError = error
                                                    self.showAlert = true
                                                case .success( _):
                                                    print("Signed in")
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
