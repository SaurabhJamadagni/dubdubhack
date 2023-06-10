//
//  ContentView.swift
//  DevShare
//
//  Created by Saurabh Jamadagni on 10/06/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var devs: [DevModel]
    
    @State private var showAddDevSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(devs) { dev in
                    Text(dev.devName)
                }
            }
            .navigationTitle("Devs")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddDevSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddDevSheet, content: {
                AddDevView(dev: DevModel(devName: "Saurabh", github: "git"))
            })
        }
    }
}

#Preview {
    ContentView()
}
