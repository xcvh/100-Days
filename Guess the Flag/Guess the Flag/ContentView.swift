//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Jeldo Arno Meppen on 09.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    var body: some View {
        VStack {
            Button("Alert!") {
                showingAlert = true
            }
            .buttonStyle(.bordered)
            .alert("Impotent Message", isPresented: $showingAlert) {
                Button("OK") {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Read this!")
            }
        }
    }
}

#Preview {
    ContentView()
}
