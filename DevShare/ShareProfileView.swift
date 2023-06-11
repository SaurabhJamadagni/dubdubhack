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
    @State private var showFilePicker = false
    
    @State private var fileURL: URL?
    
    var body: some View {
        VStack {
            Text(dummy.name)
            Button {                
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
            
            Button {
                fileURL = nil
                showFilePicker.toggle()
            } label: {
                Text("Select file")
                    .frame(maxWidth: .infinity, maxHeight: 44)
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .fileImporter(
                isPresented: $showFilePicker,
                allowedContentTypes: [.data],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let url):
                    guard let fileURL = url.first else {
                        print("No file found")
                        return
                    }
                    
                    guard fileURL.startAccessingSecurityScopedResource() else {
                        print("Can't access security scoped resource")
                        
                        return
                    }
                    
                    
                    defer { fileURL.stopAccessingSecurityScopedResource() }
                    
                    print(fileURL.absoluteString)
                    
                    let fileManager = FileManager.default

                    if fileManager.isReadableFile(atPath: fileURL.path()) {
                        print("is readable")
                    } else {
                        print("Can't read")
                    }
                    
                    if fileManager.fileExists(atPath: fileURL.path()) {
                        do {
                            let fileData = try Data(contentsOf: fileURL)
                            
                            let decoder = PropertyListDecoder()
                            let instance = try? decoder.decode(Dummy.self, from: fileData)
                            
                            print("Name: \(instance?.name ?? "Unknown")")
                        } catch {
                            print("Failed to read")
                        }
                    } else {
                        print("file doesn't exist at path")
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
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
