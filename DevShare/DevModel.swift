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
    var devName: String
    var github: String

    
    init(devName: String, github: String) {
        self.devName = devName
        self.github = github
     
    }
}


