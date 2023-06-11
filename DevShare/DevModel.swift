//
//  DevModel.swift
//  DevShare
//
//  Created by Saurabh Jamadagni on 10/06/23.
//

import Foundation
import SwiftData

@Model
final class DevModel {
    let devName: String
    let github: String
    let phoneNumber: String
    let email: String
    let twitter: String
    let linkedin: String
    let bio: String
    
    init(devName: String, github: String, phoneNumber: String, email: String, twitter: String, linkedin: String, bio: String) {
        self.devName = devName
        self.github = github
        self.phoneNumber = phoneNumber
        self.email = email
        self.twitter = twitter
        self.linkedin = linkedin
        self.bio = bio
    }
}


