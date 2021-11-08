//
//  ForgotPasswordView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/7/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    var body: some View {
        VStack{
            VStack(alignment: .leading){
        Text("Forgot Your Password?")
            .font(.custom("coolvetica", size: 38))
            
        Text("Let's Find It")
            .font(.custom("coolvetica", size: 30))
            .foregroundColor(Color("steelteal"))
            .padding(.bottom, 50)
            }
            VStack{
        InputTextField(text: .constant(""), placeholder: "Enter Your Email", keyboardType: .emailAddress)
                    .padding(.bottom, 30)
            }
            VStack{
                ButtonView(title: "Reset My Password") {
                    //TODO Write code to send reset my password
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
