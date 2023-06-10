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

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        // Handle the received data
        if let data = try? Data(contentsOf: url) {
            let decoder = PropertyListDecoder()
            if let instance = try? decoder.decode(Dummy.self, from: data) {
                // Handle the received struct instance
                print("Received struct: \(instance)")
            }
        }
        return true
    }
    
//    func handleReceivedData(_ fileURL: URL) {
//        // Access the received data from the file URL
//        do {
//            let receivedData = try Data(contentsOf: fileURL)
//            // Decode and process the received data as needed
//            // ...
//        } catch {
//            print("Failed to read or decode the received data: \(error.localizedDescription)")
//        }
//    }
}
