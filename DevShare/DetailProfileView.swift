//
//  DetailProfileView.swift
//  DevShare
//
//  Created by Nafeez Ahmed on 11/06/23.
//

import SwiftUI

struct DetailProfileView: View {
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
                    Text("Nafeez Ahmed")
                        .font(.system(size: 40))
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black.opacity(0.3))
                            .frame(width:350)
                        ScrollView {
                            VStack {
                                CustomFont(text: "+9163697498390")
                                CustomFont(text: "nafeezsyed.2003@gmail.com")
                                CustomFont(text: "Twitter : Naf_Syed")
                                CustomFont(text: "Linkedin : Nafeez Ahmed")
                                CustomFont(text: "GitHub: NafSyed")
                                CustomFont(text: "Hey, I'm Nafeez and I'm a Developer who build apps for apple platforms and I'd like to pulli it of with the best that I can!")
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

#Preview {
    DetailProfileView()
}


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
