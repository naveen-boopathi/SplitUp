//
//  ContentView.swift
//  SplitUp
//
//  Created by Naveen Boopathi on 27/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddItem = false
    
    var body: some View {
        NavigationSplitView {
            List {
                Text("Sample Text 1")
                Text("Sample Text 2")
                Text("Sample Text 3")
            }.toolbar {
                Button {
                    showAddItem.toggle()
                } label: {
                    Label("Add Item", systemImage: "plus.circle.fill")
                }
            }.sheet(isPresented: $showAddItem) {
                AddItem()
            }
        } detail: {
            Text("Select an item")
        }
        
    }
}

#Preview {
    ContentView()
}
