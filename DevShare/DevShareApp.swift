//
//  DevShareApp.swift
//  DevShare
//
//  Created by Saurabh Jamadagni on 10/06/23.
//

import SwiftUI
import SwiftData

@main
struct DevShareApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DevModel.self)
    }
}
