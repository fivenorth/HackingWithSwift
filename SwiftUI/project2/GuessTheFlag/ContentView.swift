//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Scott Johnson on 8/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var currentScore = 0
    @State var selectedFlag = 0
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    struct FlagImage: View {
        var imageName: String

        var body: some View {
            Image(imageName)
                .renderingMode(.original)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(radius: 3)
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(currentScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            if currentScore == 8 {
                Button("Play Again", action: askQuestion)
            } else {
                Button("Continue", action: askQuestion)
            }
        } message: {
            if scoreTitle == "Wrong" {
                Text("Wrong! That's the flag of \(countries[selectedFlag]).")
            }
            if currentScore == 8 {
                Text("Congratulations! You've won the game!")
            }
            Text("Your score is \(currentScore)")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        if selectedFlag == correctAnswer {
            currentScore += 1
            scoreTitle = "Correct"
        } else {
            if currentScore > 0 { currentScore -= 1 }
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if currentScore == 8 { currentScore = 0}
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
