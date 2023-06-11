//
//  DetailProfileView.swift
//  DevShare
//
//  Created by Nafeez Ahmed on 11/06/23.
//

import SwiftUI

struct DetailProfileView: View {
    @Bindable var dev: DevModel
    
    var body: some View {
        ZStack {
            Image("Nafeez")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 20)
            VStack {
                Image("Nafeez")
                    .resizable()
                    .scaledToFill()
                    .frame(width:200,height: 240)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(dev.devName)
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .fontWeight(.heavy)
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black.opacity(0.3))
                        .frame(width:350)
                    ScrollView {
                        VStack {
                            CustomFont(text: dev.phoneNumber)
                            CustomFont(text: dev.email)
                            CustomFont(text: "Twitter : \(dev.twitter)")
                            CustomFont(text: "Linkedin : \(dev.linkedin)")
                            CustomFont(text: "GitHub: \(dev.github)")
                            CustomFont(text: dev.bio)
                                .multilineTextAlignment(.center)
                            
                        }
                        .padding(30)
                    }
                }
                .frame(width:350,height: 400)
            }
        }
    }
}

//#Preview {
//    DetailProfileView(dev: DevModel(devName: "test", github: "test@git"))
//}


struct CustomFont: View {
    let text: String
    var body: some View {
        VStack {
            Text(text)
                .font(.title3)
                .foregroundStyle(.white)
                .fontWeight(.semibold)
                .fixedSize(horizontal: false, vertical: true)
                .padding(.leading,10)
            Rectangle()
                .frame(width:350,height: 1.5)
                .foregroundColor(.white.opacity(0.4))
        }
     
   
    }
}
