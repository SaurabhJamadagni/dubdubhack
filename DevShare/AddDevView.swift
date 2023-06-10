//
//  AddDevView.swift
//  DevShare
//
//  Created by Saurabh Jamadagni on 10/06/23.
//

import SwiftUI

struct AddDevView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var dev: DevModel
    
    var body: some View {
        VStack {
            TextField("Developer's name", text: $dev.devName)
            TextField("Github", text: $dev.github)
           // TextField("testing nest", text: $dev.personal.name)
            Button("Save") {
                let newDev = DevModel(devName: dev.devName, github: dev.github)
                modelContext.insert(newDev)
            }
        }
        .navigationTitle("Dev profile")
    }
}

//#Preview {
//    AddDevView(dev: DevModel(devName: "Saurabh", github: "saurabh@github"))
//}

/// ObservableObject
/// ObservedObject
