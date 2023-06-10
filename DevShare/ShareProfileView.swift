//
//  ShareProfileView.swift
//  DevShare
//
//  Created by Nafeez Ahmed on 11/06/23.
//

import SwiftUI
import UniformTypeIdentifiers

struct ShareProfileView: View {
    
    var dummy: Dummy
    
    @State private var dataToShare: [Any] = []
    
    @State private var showShareSheet = false
    
    var body: some View {
        VStack {
            Text(dummy.name)
            Button {
//                showShareSheet.toggle()
                // share complete
//                guard let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: dummy, requiringSecureCoding: false) else {
//                    // Handle encoding failure
//                    return
//                }
//                print("Hi")
//                dataToShare = encodedData
//                print("Button is tapped")
                
                do {
                    let encoder = PropertyListEncoder()
                    let data = try encoder.encode(dummy)
                    dataToShare = [data]
                    showShareSheet.toggle()
                } catch {
                    print("plist conversion failed")
                }
          
                
            } label: {
                Text("Share")
                    .frame(maxWidth: .infinity, maxHeight: 44)
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $showShareSheet, content: {
                ShareView(activityItems: dataToShare)
            })
        }
    }
    
    func JSONize() -> Data? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dummy, options: [])
            return jsonData
            // Use the jsonData as needed
        } catch {
            // Handle serialization error
            print("Can't conver to JSON")
            return nil
        }
    }
}

struct ShareView: UIViewControllerRepresentable {
    let activityItems: [Any]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UIActivityViewController(activityItems: activityItems , applicationActivities: nil)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
}

#Preview {
    ShareProfileView(dummy: Dummy(name: "Saurabh", github: "saurabh@github"))
}


struct Dummy: Codable {
    var name: String
    var github: String
}

extension UTType {
    static let customFormat = UTType(importedAs: "com.saurabhjamadagni.DevShare.fileFormat")
}
