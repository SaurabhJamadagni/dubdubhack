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
    @State private var animatingColors: Bool = false
    let color = Color.purple
    var body: some View {
        ZStack {
            LinearGradient(colors: [ .blue , .purple], startPoint:.topLeading, endPoint:  .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            Circle()
                .frame(width:300,height: 350)
                .foregroundColor(.purple)
                .offset(x:animatingColors ? -120 : 0 ,y: animatingColors ?  0 : -240)
                .blur(radius: 35)
            Circle()
                .frame(width:300,height: 350)
                .foregroundColor(.blue)
                .offset(x:animatingColors ? 0 : 120,y:animatingColors ? 0 : 170)
                .blur(radius: 35)
            ScrollView {
                VStack {
                    ZStack(alignment: .bottomTrailing) {
                        Circle()
                            .stroke(.white.opacity(0.5),lineWidth: 3)
                            .frame(width:100,height: 80)
                        Button {
                            
                        }label: {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width:30,height: 20)
                                .foregroundStyle(.white)
                        }
                    }
                    CustomTextField(placeholder: "Enter your name", text: $text)
                    CustomTextField(placeholder: "Enter your Phone Number", text: $phoneNumber)
                    CustomTextField(placeholder: "Enter your Email", text: $email)
                    CustomTextField(placeholder: "Enter your Twitter Handle", text: $twitter)
                    CustomTextField(placeholder: "Enter your Linkedin Handle", text: $linkedin)
                    CustomTextField(placeholder: "Enter your GitHub handle", text: $github)
                    CustomTextField(placeholder: "Enter your bio", text: $bio)
                    
                    Button {
                        
                    }label: {
                        VStack {
                            Text("Save")
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                        }
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                
                        }
                        
                    }
                    .padding()
         
                    
                }
                
            }
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 3.0).repeatForever()) {
                animatingColors.toggle()
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
                .fill(.white.opacity(0.3))
            TextField(placeholder, text: $text)
                .padding(.leading, 4)
                .foregroundColor(.white)
            
        }
        .frame(width:350,height:50)
        .padding()
  
    }
}
