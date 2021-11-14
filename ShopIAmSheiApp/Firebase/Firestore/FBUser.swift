//
//  FBUser.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/12/21.
//

import Foundation

struct FBUser {
    let uid: String
    let firstName: String
    let lastName: String
    let email: String
    let profilePictureUrl: String
    
    
    // App Specific properties can be added here
    
    init(uid: String, firstName: String,lastName:String, profilePictureUrl: String, email: String) {
        self.uid = uid
        self.firstName = firstName
        self.email = email
        self.profilePictureUrl = profilePictureUrl
        self.lastName = lastName
        
        
    }

}

extension FBUser {
    init?(documentData: [String : Any]) {
        let uid = documentData[FBKeys.User.uid] as? String ?? ""
        let firstName = documentData[FBKeys.User.firstName] as? String ?? ""
        let lastName = documentData[FBKeys.User.lastName] as? String ?? ""
        let email = documentData[FBKeys.User.email] as? String ?? ""
        let profilePictureUrl = documentData[FBKeys.User.profilePictureUrl] as? String ?? ""
        
        // Make sure you also initialize any app specific properties if you have them
        
        self.init(uid: uid,
                  firstName: firstName,
                  lastName: lastName,
                  profilePictureUrl: profilePictureUrl,
                  email: email
                  // Dont forget any app specific ones here too
        )
    }
    
    static func dataDict(uid: String, firstName: String, lastName:String, email: String, profilePictureUrl: String) -> [String: Any] {
        var data: [String: Any]
        
        // If name is not "" this must be a new entry so add all first time data
        if firstName != "" {
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.firstName: firstName,
                FBKeys.User.email: email,
                FBKeys.User.lastName: lastName,
                FBKeys.User.profilePictureUrl: profilePictureUrl
                // Again, include any app specific properties that you want stored on creation
            ]
        } else {
            // This is a subsequent entry so only merge uid and email so as not
            // to overrwrite any other data.
            data = [
                FBKeys.User.uid: uid,
                FBKeys.User.email: email
            ]
        }
        return data
    }
}
