//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Jeldo Arno Meppen on 09.12.23.
//

import SwiftUI

struct FlagView: View {
    var countries: [String]
    var number: Int
    
    var body: some View {
        Image(countries[number])
            .clipShape(.rect(cornerRadius: 5))
            .shadow(radius: 5)
    }
}

struct LargeBlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(LargeBlueTitle())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var round = 0
    @State private var showingFinalScore = false
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .titleStyle()
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagView(countries: countries, number: number)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                Spacer()
                Spacer()
                Text("Score: \(userScore)")
                    .font(.title.bold())
                    .foregroundStyle(.white)
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("OK") { askQuestion() }
        } message: {
            Text("Your score is \(userScore)")
        }
        .alert(scoreTitle + " You played 8 rounds!", isPresented: $showingFinalScore) {
            Button("Restart") {
                round = 0
                userScore = 0
                askQuestion()
            }
        } message: {
            Text("Your total score is \(userScore)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            userScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])."
        }
        
        round += 1
        showingFinalScore = round == 8 ? true : false
        showingScore = round == 8 ? false : true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    ContentView()
}
