//
//  ContentView.swift
//  Rock Paper Scissors
//
//  Created by Jeldo Arno Meppen on 13.12.23.
//

import SwiftUI

struct ContentView: View {
    let move = ["🪨", "📜", "✂️"]
    @State private var currentMoveComputer = "🪨"
    @State private var playerShouldWin = true
    @State private var score = 0
    @State private var round = 0
    @State private var alertTitle = ""
    @State private var scoreIsPresented = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text(currentMoveComputer)
                    .font(.largeTitle)
                Text(playerShouldWin ? "Try to win" : "Try to lose")
                Spacer()
                HStack {
                    ForEach(0..<3) {
                        
                        Button(move[$0]) {
                            scoreIsPresented = true
                        }
                        .font(.system(size: 70))
                        .padding()
                    }
                }
                .alert(alertTitle, isPresented: $scoreIsPresented) {
                    Button("OK") { playRound() }
                }
                Spacer()
                HStack {
                    Text("Score: \(score)")
                    Spacer()
                    Text("Round: \(round)")
                }
            }
            .padding()
        }
    }
    
    func playRound() {
        currentMoveComputer = move[Int.random(in: 0...2)]
        playerShouldWin = Bool.random()
        round += 1
    }
    
    func testMove(computer: String, player: String, shouldWin: Bool) -> Bool {
        let move = (computer, player) // ["🪨", "📜", "✂️"]
        if shouldWin == true {
            switch move {
            case ("🪨", "📜"):
                return true
            case ("📜", "✂️"):
                return true
            case ("✂️", "🪨"):
                return true
            default:
                return false
            }
        } else {
            switch move {
            case ("🪨", "📜"):
                return false
            case ("📜", "✂️"):
                return false
            case ("✂️", "🪨"):
                return false
            default:
                return false
        }
        }
    }
}

