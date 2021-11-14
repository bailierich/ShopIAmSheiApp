//
//  HomeView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/8/21.
//

import SwiftUI


struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    

    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let screenWidth = screenSize.width
        
        VStack(alignment: .leading){
            VStack{
        Text("Hello \(userInfo.user.firstName)")
            .font(.custom("coolvetica", size: 55))
            }
            
            VStack(alignment:.leading){
        Text("Upcoming Appointments")
            .font(.custom("coolvetica", size: 30))
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .frame(width: screenWidth * 0.9, height: screenHeight * 0.1)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 6)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserInfo())
    }
}
