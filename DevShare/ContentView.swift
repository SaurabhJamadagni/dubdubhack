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
            List(devs) { dev in
                NavigationLink(dev.devName) {
                    DetailProfileView(dev: dev)
                }
            }
            .navigationTitle("Devs")
            .listStyle(.plain)
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
                ProfileView()
            })
        }
    }
}

#Preview {
    ContentView()
}

