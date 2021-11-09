//
//  SignUpView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/5/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    
    @State var email = ""
    @State var phoneNumber = ""
    @State var firstName = ""
    @State var lastName = ""
    @State var password = ""
    
    @State var image: UIImage?
    @State var shouldShowImagePicker = false
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
      
        
        
        
        NavigationView{
            
        VStack{
            
        VStack(alignment: .leading){
          
            //Checking Screen Height to determine what size font should be shown for text
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
                        .padding(.bottom, 10)
            }
        }
                
            
                    VStack{
                        if screenHeight <= 737 {
                            
                            Button{
                                shouldShowImagePicker.toggle()
                            } label:{
                                VStack{
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                }else{
                                    Image( systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(.black)
                               
                                }
                            }
                                .overlay(RoundedRectangle(cornerRadius: 64)
                                .stroke(Color.black, lineWidth: 3))
                            }
                            
                            Text("Choose Your Profile Picture")
                                    .font(.custom("coolvetica", size: 12))
                                    .foregroundColor(.black)
                            
                            InputTextField(text: .constant(""), placeholder: "First Name", keyboardType: .namePhonePad, fontSize: 16)
                              //  .padding(.bottom, 5)
                            
                            InputTextField(text: .constant(""), placeholder: "Last Name", keyboardType: .namePhonePad, fontSize: 16)
                               // .padding(.bottom, 5)
                                
                            InputTextField(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, fontSize: 16)
                              //  .padding(.bottom, 5)
                            
                            InputTextField(text: .constant(""), placeholder: "Phone Number", keyboardType: .phonePad, fontSize: 16)
                              //  .padding(.bottom, 5)
                            
                            PasswordInputView(password: .constant(""), placeholder: "Password", fontSize: 16)
                             //   .padding(.bottom, 5)
                            
                            PasswordInputView(password: .constant(""), placeholder: "Confirm Password", fontSize: 20)
                                .padding(.bottom, 10)
                            
                            
                        }
                        
                        else{
                            
                            Button{
                                shouldShowImagePicker.toggle()
                            } label:{
                                VStack{
                                if let image = self.image {
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 128, height: 128)
                                        .cornerRadius(64)
                                }else{
                                    
                                    Image( systemName: "person.fill")
                                        .font(.system(size: 64))
                                        .padding()
                                        .foregroundColor(.black)
                                    }
                                }
                                            .overlay(RoundedRectangle(cornerRadius: 64)
                                            .stroke(Color.black, lineWidth: 3))
                            }
                            
                            Text("Choose Your Profile Picture")
                                        .font(.custom("coolvetica", size: 16))
                                         .foregroundColor(.black)
                
                            InputTextField(text: .constant(""), placeholder: "First Name", keyboardType: .namePhonePad, fontSize: 18)
                             //   .padding(.bottom, 2)
                            
                            InputTextField(text: .constant(""), placeholder: "Last Name", keyboardType: .namePhonePad, fontSize: 18)
                              //  .padding(.bottom, 2)
                            
                            InputTextField(text: .constant(""), placeholder: "Email", keyboardType: .emailAddress, fontSize: 18)
                               // .padding(.bottom, 2)
                            
                            InputTextField(text: .constant(""), placeholder: "Phone Number", keyboardType: .phonePad, fontSize: 18)
                                //.padding(.bottom, 2)
                            
                            PasswordInputView(password: .constant(""), placeholder: "Password", fontSize: 20)
                                //.padding()
                            
                            PasswordInputView(password: .constant(""), placeholder: "Confirm Password", fontSize: 18)
                                .padding(.bottom, 20)
                        }
            }
            
            VStack{
                ButtonView(title: "Sign Up") {
                    //TO DO Write Code for Sign Up
                    CreateNewAccount()
                }
                
            }
    }
            
}
        
        .navigationBarHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
            
            ImagePickerComponent(image: $image)
                .ignoresSafeArea()
        }
    }

    private func CreateNewAccount(){
        
        Auth.auth().createUser(withEmail: email, password: password) { Result, err in
            if let err = err {
                
                print("failed to create user", err)
             
                return
            }
        }
        
    }
    
    
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

}
