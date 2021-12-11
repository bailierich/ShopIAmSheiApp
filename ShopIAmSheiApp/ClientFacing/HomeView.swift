//
//  HomeView.swift
//  ShopIAmSheiApp
//
//  Created by Bailie Richard on 11/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    @EnvironmentObject var userInfo: UserInfo
    
    //TO DO connect picture to display if picture is not found display person fill
    //TO DO add scroll view

    var body: some View {
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height
        let screenWidth = screenSize.width
        NavigationView{
            
        VStack{

            VStack{
                if (userInfo.user.profilePictureUrl == "")
                {
                Image( systemName: "person.fill")
                    .font(.system(size: 120))
                    .padding()
                    .foregroundColor(.black)
                }
                else{
                WebImage(url: URL(string: userInfo.user.profilePictureUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                        .cornerRadius(120)
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 120)
                        .stroke(Color.black, lineWidth: 1))
            
            VStack{
        Text("Hello \(userInfo.user.firstName)")
            .font(.custom("coolvetica", size: 55))
            }
           
        VStack(alignment: .leading){
           
            
            VStack(alignment:.leading){
        Text("Your Upcoming Appointment")
            .font(.custom("coolvetica", size: 30))
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 13, style: .continuous)
                    .frame(width: screenWidth * 0.9, height: screenHeight * 0.1)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 0, y: 6)
                Text("Holy Grail Appointment - Nov. 19th, 2021 8:00 AM")
                    .font(.custom("coolvetica", size: 18))
                
            }.padding(.bottom)
            HStack{
                Button {
                    //TO DO book an appointment action
                } label: {
                    Text("Book An Appointment")
                        .font(.custom("coolvetica", size: 20))
                        .frame(maxWidth: screenWidth * 0.8, minHeight: 20 )
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("steelteal"))
                        .cornerRadius(42)
                    
                }
                
                
                
//                Button {
//                    //TO DO reschedule an appointment action
//                    // may just make it able to only book an appointment for now
//                } label: {
//                    Text("Reschedule Appointment")
//                        .font(.custom("coolvetica", size: 15))
//                        .padding()
//                        .foregroundColor(.white)
//                        .background(Color("steelteal"))
//                        .cornerRadius(42)
//
//                }

            }
            
            VStack{
                
                Text("My Hair Journey W/ Shei")
                    .font(.custom("coolvetica", size: 30))
            }
            
            HStack{
                
                // need to create logic to save pictures and a note to a specific user
                // create checkin page where pictures can be added the date and a note
                // create display screen that will pop out with full information once photo is click
                // if no checkins/updates are found then display text, no updates found would you like to add one with button
                // allow shei to also add updates to individual users
                
                Image( systemName: "person.fill")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.black, lineWidth: 1))
                
                Image( systemName: "person.fill")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.black, lineWidth: 1))
                
                Image( systemName: "person.fill")
                    .font(.system(size: 80))
                    .padding()
                    .foregroundColor(.black)
                    .overlay(RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.black, lineWidth: 1))
                
                
            }
            
        }
        }
        .toolbar {
            ToolbarItem(placement:.navigationBarLeading){
                Button {
                    
                } label: {
                    VStack{
                    Image("CombIcon")
                            .resizable()
                            .frame(width: 40, height: 40)
                    Text("Menu")
                    }
                    
                }
            }
            ToolbarItem(placement:.navigationBarTrailing){
                Button {
                    
                } label: {
                    Text("Log Out ")
                }
            }
        }
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(UserInfo())
    }
}
