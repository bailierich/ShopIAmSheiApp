//
//  UserViewModel.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/11/21.
//

import Foundation

struct UserViewModel{
    var email = ""
    var phoneNumber = ""
    var firstName = ""
    var lastName = ""
    var password = ""
    var confirmPassword = ""
    
    //validation checks
    
    func passwordsMatch(_confirmPW:String) -> Bool{
        
        return _confirmPW == password
        
    }
    
    func isEmpty(_field:String) -> Bool {
        
        return _field.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func isEmailValid(_email: String) -> Bool {
            let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                           "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
            return emailTest.evaluate(with: email)
        }
        
        
    func isPasswordValid(_password: String) -> Bool {
        
            // Password must be 8 chars, contain a capital letter and a number
            let passwordTest = NSPredicate(format: "SELF MATCHES %@",
                                           "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$")
            return passwordTest.evaluate(with: password)
        }
    
    func isPhoneNumberValid(_phoneNumber:String) -> Bool{
        
            let regularExpressionForPhone = "^\\d{3}-\\d{3}-\\d{4}$"
            let testPhone = NSPredicate(format:"SELF MATCHES %@", regularExpressionForPhone)
            return testPhone.evaluate(with: phoneNumber)
    }
    
    
        
    var isSignUpComplete:Bool  {
        
            if  !isEmailValid(_email: email) ||
                !isPhoneNumberValid(_phoneNumber: phoneNumber) ||
                isEmpty(_field: firstName) ||
                isEmpty(_field: lastName) ||
                isEmpty(_field: phoneNumber) ||
                !isPasswordValid(_password: password) ||
                !passwordsMatch(_confirmPW: confirmPassword){
                return false
            }
            return true
        }
    
    var isLogInComplete:Bool {
        
            if isEmpty(_field: email) ||
                isEmpty(_field: password) {
                return false
            }
        
            return true
        }
        
        // Validation Error Strings
        var validFirstNameText: String {
            if !isEmpty(_field: firstName) {
                return ""
            } else {
                return "Enter Your First Name"
            }
        }
    
    var validLastNameText: String {
        if !isEmpty(_field: lastName) {
            return ""
        } else {
            return "Enter Your Last Name"
        }
    }
    
    var validPhoneNumberText: String {
        if isPhoneNumberValid(_phoneNumber: phoneNumber) {
            return ""
        } else {
            return "Enter Valid Phone Number"
        }
    }
        
        var validEmailAddressText:String {
            if isEmailValid(_email: email) {
                return ""
            } else {
                return "Enter A Valid Email Address"
            }
        }
        
        var validPasswordText:String {
            if isPasswordValid(_password: password) {
                return ""
            } else {
                return "Must Be 8 Characters Containing At Least One Number And One Capital Letter."
            }
        }
        
        var validConfirmPasswordText: String {
            if passwordsMatch(_confirmPW: confirmPassword) {
                return ""
            } else {
                return "Password Fields Do Not Match."
            }
        }

}

