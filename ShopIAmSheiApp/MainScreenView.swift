//
//  ContentView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/5/21.
//

import SwiftUI
import Firebase

struct MainScreenView: View {
    
    @State private var isShowingLoginView = false
    @State private var isShowingSignUpView = false
    @EnvironmentObject var userInfo: UserInfo
    
    
    var body: some View {
        
        Group{
        if userInfo.isUserAuthenticated == .signedIn {
            HomeView()
        }
        }
        .onAppear {
            self.userInfo.configureFirebaseStateDidChange()
        }
            
        
      NavigationView{
          
        ZStack{
            
            let screenSize: CGRect = UIScreen.main.bounds
            let screenWidth = screenSize.width
            let screenHeight = screenSize.height
        
        Image("LoginBg")
        .resizable()
        .aspectRatio(contentMode: .fill)
            VStack{
                
                if screenHeight <= 736{
                    Image("IAmShei_Logo")
                    
                        .resizable()
                        .frame(width: 290.0, height: 150)
                        .aspectRatio(contentMode: .fit)
                        // .padding(.bottom, 100)
                        .offset(x: 0 ,y: -120)
                        Spacer().frame(minHeight: 40, maxHeight: 200)
                }
                else{
       
                    Image("IAmShei_Logo")
                   
                        .resizable()
                        .frame(width: 290.0, height: 150)
                        .aspectRatio(contentMode: .fit)
                   // .padding(.bottom, 100)
                        .offset(x: 0 ,y: -150)
                        Spacer().frame(minHeight: 40, maxHeight: 300)
                }
                
                VStack{
                    NavigationLink( destination: SignInView(), isActive: $isShowingLoginView){ }.navigationBarBackButtonHidden(true)
                    Button(action:{
                        isShowingLoginView = true
                    })
                {
                    Text("Login")
                        .frame(width: screenWidth * 0.9, height: 60)
                        .background(Color("steelteal"))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .font(Font.custom("coolvetica",size: 30))
                }
                    Spacer().frame(minHeight: 3, maxHeight: 8)
                    
                    
                    
                    NavigationLink( destination: SignUpView(), isActive: $isShowingSignUpView){ }.navigationBarBackButtonHidden(true)
                    Button(action:{ isShowingSignUpView = true})
                {
                    Text("Sign Up")
                        .frame(width: screenWidth * 0.9, height: 60)
                        .background(Color(.white))
                        .foregroundColor(.black)
                        .cornerRadius(30)
                        .font(Font.custom("Coolvetica",size: 30))
                    
                }
       
                }

            }
        
        
    }
}
    }

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
            MainScreenView()
    }
}
}

