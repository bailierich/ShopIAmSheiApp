//
//  ShopIAmSheiAppApp.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/5/21.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct ShopIAmSheiAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var userInfo = UserInfo()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                MainScreenView().environmentObject(userInfo)
            }
            
        }
    }
}




