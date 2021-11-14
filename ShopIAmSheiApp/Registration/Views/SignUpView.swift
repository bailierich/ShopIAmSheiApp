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
    @State var confirmPassword = ""
    
    @EnvironmentObject var userInfo: UserInfo
    @State var user: UserViewModel = UserViewModel()
    
    @State var image: UIImage?
    @State var shouldShowImagePicker = false
    
    @State private var showError = false
    @State private var errorString = ""
    
    @State private var showAlert = false
        @State private var authError: EmailAuthError?
    
    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let maxWidthDecimalSignUpView = 0.9
        
        
        
        
        
        NavigationView{
            
            VStack{
                
                VStack(alignment: .leading){
                    
                    //Checking Screen Height to determine what size font should be shown for text
                    if screenHeight <= 737{
                        
                        
                        Text("Hello New Client")
                            .font(.custom("coolvetica", size: 50))
                        Text("Let's Get You Registered")
                            .font(.custom("coolvetica", size: 20))
                            .foregroundColor(Color("steelteal"))
                            .padding(.bottom, 10)
                        
                        
                        
                        
                    } else
                    {
                        
                        Text("Hello New Client")
                            .font(.custom("coolvetica", size: 55))
                        Text("Let's Get You Registered")
                            .font(.custom("coolvetica", size: 30))
                            .foregroundColor(Color("steelteal"))
                            .padding(.bottom, 30)
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
                                        .font(.system(size: 34))
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
                        
                        ScrollView{
                                Group {
                                    
                                    VStack{
                                        InputTextField(text: self.$user.firstName, placeholder: "First Name", keyboardType: .namePhonePad, fontSize: 16, maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                                        //  .padding(.bottom, 5)
                                        if !user.validFirstNameText.isEmpty {
                                            Text(user.validFirstNameText).font(.caption).foregroundColor(.red)
                                        }
                                    }
                                    
                                    VStack{
                                        InputTextField(text: self.$user.lastName, placeholder: "Last Name", keyboardType: .namePhonePad, fontSize: 16, maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                                        // .padding(.bottom, 5)
                                        if !user.validLastNameText.isEmpty {
                                            Text(user.validLastNameText).font(.caption).foregroundColor(.red)
                                        }
                                    }
                                    VStack{
                                        InputTextField(text: self.$user.email, placeholder: "Email", keyboardType: .emailAddress, fontSize: 16, maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                                        //  .padding(.bottom, 5)
                                        if !user.validEmailAddressText.isEmpty {
                                            Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                                        }
                                    }
                                    
                                    VStack{
                                        InputTextField(text: self.$user.phoneNumber, placeholder: "Phone Number", keyboardType: .phonePad, fontSize: 16, maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                                        //  .padding(.bottom, 5)
                                        if !user.validPhoneNumberText.isEmpty {
                                            Text(user.validPhoneNumberText).font(.caption).foregroundColor(.red)
                                        }
                                    }
                                    VStack{
                                        PasswordInputView(password: $password, placeholder: "Password", fontSize: 16, fieldSize: 22, deviderSize: 30)
                                        //   .padding(.bottom, 5)
                                        if !user.validPasswordText.isEmpty {
                                            Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                                        }
                                        
                                    }
                                    
                                    VStack{
                                        PasswordInputView(password: $confirmPassword, placeholder: "Confirm Password", fontSize: 16, fieldSize: 22, deviderSize: 30)
                                            .padding(.bottom, 20)
                                        if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                                            Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                                        }
                                    }
                                    
                                }
                        }
                            
                            VStack{
                                ButtonView(title: "Sign Up"){
                                    //TO DO Write Code for Sign Up
                                    CreateNewAccount()
                                }
                                .disabled(!user.isSignUpComplete)
                                
                            }
                            .alert(isPresented: $showError){
                            Alert(title: Text("Error creating accout"), message: Text(self.errorString), dismissButton: .default(Text("OK")))
                            }
                        
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
                            .padding(.bottom, 20)
                        ScrollView{
                            
                            Group{
                                
                            
                            VStack{
                                InputTextField(text: self.$user.firstName, placeholder: "First Name", keyboardType: .namePhonePad, fontSize: 18,maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                            //   .padding(.bottom, 2)
                                
                                if !user.validFirstNameText.isEmpty {
                                    Text(user.validFirstNameText).font(.caption).foregroundColor(.red)
                                }
                            }
                            
                            VStack{
                                InputTextField(text: self.$user.lastName, placeholder: "Last Name", keyboardType: .namePhonePad, fontSize: 18,maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                            //  .padding(.bottom, 2)
                                
                                if !user.validLastNameText.isEmpty {
                                    Text(user.validLastNameText).font(.caption).foregroundColor(.red)
                                }
                            }
                            
                            VStack{
                                InputTextField(text: self.$user.email, placeholder: "Email", keyboardType: .emailAddress, fontSize: 18,maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                            // .padding(.bottom, 2)
                                
                                if !user.validEmailAddressText.isEmpty {
                                    Text(user.validEmailAddressText).font(.caption).foregroundColor(.red)
                                }
                            }
                            
                            VStack{
                                InputTextField(text: self.$user.phoneNumber, placeholder: "Phone Number", keyboardType: .phonePad, fontSize: 18,maxWidthDecimal: maxWidthDecimalSignUpView,deviderSize: 30)
                            //.padding(.bottom, 2)
                                
                                if !user.validPhoneNumberText.isEmpty {
                                    Text(user.validPhoneNumberText).font(.caption).foregroundColor(.red)
                                }
                            }
                            
                            VStack{
                                PasswordInputView(password: self.$user.password, placeholder: "Password", fontSize: 20, fieldSize: 22,deviderSize: 30)
                            //.padding()
                                
                                if !user.validPasswordText.isEmpty {
                                    Text(user.validPasswordText).font(.caption).foregroundColor(.red)
                                }
                            }
                            
                            VStack{
                                PasswordInputView(password: self.$user.confirmPassword, placeholder: "Confirm Password", fontSize: 18, fieldSize: 22,deviderSize: 30)
                                .padding(.bottom, 40)
                                
                                if !user.passwordsMatch(_confirmPW: user.confirmPassword) {
                                    Text(user.validConfirmPasswordText).font(.caption).foregroundColor(.red)
                                }
                            }
                            }
                        }
                            VStack{
                            NavigationLink(destination: HomeView(), isActive: $SignUpSuccess){ }
                                ButtonView(title: "Sign Up"){
                                    //TO DO Write Code for Sign Up
                                    CreateNewAccount()
                                    FBAuth.authenticate(withEmail: self.user.email,
                                                                            password: self.user.password) { (result) in
                                                                                switch result {
                                                                                case .failure(let error):
                                                                                    self.authError = error
                                                                                    self.showAlert = true
                                                                                case .success( _):
                                                                                    print("Signed in")
                                                                                }
                                                        }
                                }
                                .opacity(user.isSignUpComplete ? 1 : 0.75)
                                .disabled(!user.isSignUpComplete)

                                
                            }
                            .alert(isPresented: $showError){
                            Alert(title: Text("Error creating accout"), message: Text(self.errorString), dismissButton: .default(Text("OK")))
                            }
                       
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
    
    @State var loginStatusMessage = ""
    @State var SignUpSuccess = false
    private func CreateNewAccount(){
        
        
        FBAuth.createUser(
            withEmail: self.user.email,
            firstName: self.user.firstName,
            password: self.user.password, lastName: self.user.lastName,
            profilePictureUrl: "") { (restult) in
            
                                                  switch restult {
                                                  case .failure(let error):
                                                      self.errorString = error.localizedDescription
                                                      self.showError = true
                                                  case .success( _):
                                                      print("Account creation successful")
                                                    SignUpSuccess = true
                                                  }
        }
            
            
        self.persistImageToStorage()

        }
        
      
    
    
    private func persistImageToStorage() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let ref = Storage.storage().reference(withPath: uid)
        guard let imageData = self.image?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.loginStatusMessage = "Failed to push image to Storage: \(err)"
                return
            }
            
            ref.downloadURL { url, err in
                if let err = err {
                    self.loginStatusMessage = "Failed to retrieve downloadURL: \(err)"
                    return
                }
                
                self.loginStatusMessage = "Successfully stored image with url: \(url?.absoluteString ?? "")"
                print(url?.absoluteString)
                
                guard let url = url else {return}
                self.StoreUserImformation(imageProfileURL: url)
            }
        }
    }
    
    private func StoreUserImformation(imageProfileURL: URL){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("users").document(uid).updateData(["profilePictureUrl": imageProfileURL.absoluteString])
          
        
    }
    
    
    
    struct SignUpView_Previews: PreviewProvider {
        static var previews: some View {
            SignUpView()
        }
    }
    
}
