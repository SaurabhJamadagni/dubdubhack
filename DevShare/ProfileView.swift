//
//  ProfileView.swift
//  DevShare
//
//  Created by Nafeez Ahmed on 10/06/23.
//

import SwiftUI
import PhotosUI
import SwiftData
struct ProfileView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var devName: String = ""
    @State private var phoneNumber: String = ""
    @State private var email: String = ""
    @State private var twitter: String = ""
    @State private var linkedin: String = ""
    @State private var github: String = ""
    @State private var bio: String = ""
    @State private var imageSelected: Bool = false
    @State private var image = UIImage()
    
    @State private var animatingColors: Bool = false

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
                        
                        Image(uiImage: self.image)
                                .resizable()
                                .cornerRadius(50)
                                .padding(.all, 4)
                                .frame(width: 120, height: 120)
                                .background(Color.black.opacity(0.2))
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .padding(8)
                        Button  {
                            imageSelected = true
                        }label: {
                            Image(systemName: "camera.fill")
                                .font(.title)
                                .foregroundColor(.white)
                        }
                    }
                    .sheet(isPresented: $imageSelected) {
                            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                    }
                    CustomTextField(placeholder: "Enter your name", text: $devName)
                    CustomTextField(placeholder: "Enter your Phone Number", text: $phoneNumber)
                    CustomTextField(placeholder: "Enter your Email", text: $email)
                    CustomTextField(placeholder: "Enter your Twitter Handle", text: $twitter)
                    CustomTextField(placeholder: "Enter your Linkedin Handle", text: $linkedin)
                    CustomTextField(placeholder: "Enter your GitHub handle", text: $github)
                    CustomTextField(placeholder: "Enter your bio", text: $bio)
                    
                    Button {
                        let newDev = DevModel(devName: devName, github: github, phoneNumber: phoneNumber, email: email, twitter: twitter, linkedin: linkedin, bio: bio)
                        modelContext.insert(newDev)
                        dismiss()
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

@Model
class ExampleData{
   
    
    let id = UUID()
    let photo: Data?
    
    init(id: UUID , photo: Data?) {
        self.id = id
        self.photo = photo
    }
}

