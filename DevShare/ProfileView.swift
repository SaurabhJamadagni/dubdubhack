//
//  ProfileView.swift
//  DevShare
//
//  Created by Nafeez Ahmed on 10/06/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var text: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var twitter: String = ""
    @State private var linkedin: String = ""
    @State private var github: String = ""
    @State private var bio: String = ""
    let color = Color.purple
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black,.purple], startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Circle()
                            .stroke(.gray,lineWidth: 3)
                            .frame(width:100,height: 80)
                        Button {
                            
                        }label: {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width:30,height: 20)
                        }
                    }
                    CustomTextField(placeholder: "Enter your name", text: $text)
                    CustomTextField(placeholder: "Enter your Phone Number", text: $phoneNumber)
                    CustomTextField(placeholder: "Enter your Email", text: $email)
                    CustomTextField(placeholder: "Enter your Twitter Handle", text: $twitter)
                    CustomTextField(placeholder: "Enter your Linkedin Handle", text: $linkedin)
                    CustomTextField(placeholder: "Enter your GitHub handle", text: $github)
                    CustomTextField(placeholder: "Enter your bio", text: $bio)
                }
                
            }
        }
    }
}

#Preview {
    ProfileView()
}


struct CustomTextField: View {
    
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width:300)
       
            
            TextField(placeholder, text: $text)
                .padding(.bottom, 4)
                .foregroundColor(.white)
            
        }
        .padding()
  
    }
}
