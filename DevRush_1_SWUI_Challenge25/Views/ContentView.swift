//
//  ContentView.swift
//  DevRush_1_SWUI_Challenge25
//
//  Created by Sergey on 18.07.2025.
//

import SwiftUI

struct Figure {
    
    var name: String
    var image: String
    var winFigure: String
    var loseFigure: String
    
    init(name: String, image: String, winFigure: String, loseFigure: String) {
        self.name = name
        self.image = image
        self.winFigure = winFigure
        self.loseFigure = loseFigure
    }
    
    func isWin(check: String)-> Bool {
        if check == winFigure {
            return true
        } else {
            return false
        }
        
        
    }
    
    func isEqual(check: String) -> Bool {
        if check == name {
            return true
        } else {
            return false
        }
    }
    
}

var rock = Figure(name: "rock", image: "rock", winFigure: "scissors", loseFigure: "paper")
var paper = Figure(name: "paper", image: "paper", winFigure: "rock", loseFigure: "scissors")
var scissors = Figure(name: "scissors", image: "scissors", winFigure: "paper", loseFigure: "rock")

struct ContentView: View {
    
    @State private var figureArray: [Figure] = [rock, paper, scissors]
    @State private var computerChoice:Int = 0
    @State private var playerScore: Int = 0
    @State private var computerScore: Int = 0
    
    var body: some View {
        
        VStack {
            
            Text("Computer score: \($computerScore.wrappedValue)")
            
            Image(figureArray[$computerChoice.wrappedValue].image)
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFill()
            
            
            HStack {
                
                ForEach(0..<3) { figure in
                    
                    Button{
                        userButtonTapped(buttonID: figureArray[figure])
                    } label: {
                            Image(figureArray[figure].image)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .scaledToFill()
                    }
                }
                
            }
            
            Text("Player score: \($playerScore.wrappedValue)")
            
        }
        
    }
    
    func userButtonTapped(buttonID: Figure) {
        
        computerChoice = Int.random(in: 0...2)
        
        if figureArray[computerChoice].isEqual(check: buttonID.name) == false {
            
            if figureArray[computerChoice].isWin(check: buttonID.name){
                computerScore += 1
            } else {
                playerScore += 1
            }
        }
    }
    
}

#Preview {
    ContentView()
}
