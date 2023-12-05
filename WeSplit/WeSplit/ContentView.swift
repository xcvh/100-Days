//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeldo Arno Meppen on 05.12.23.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    let students = ["Harry","Ron","Hermoine"]
    @State private var selectedStudent = "Ron"
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(students, id: \.self) {Text($0)}
                    }
                }
                Section {
                    Button(tapCount != 69 ? "\(selectedStudent) tapped me \(tapCount) times!" : "Noice!") {
                        tapCount += 1
                    }
                }
            }.navigationTitle("WeSplit").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
