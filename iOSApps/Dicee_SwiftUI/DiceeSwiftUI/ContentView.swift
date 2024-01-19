//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Sweda Thiyagarajan on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDice = 1
    @State var rightDice = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDice)
                    DiceView(n: rightDice)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDice = Int.random(in: 1...6)
                    self.rightDice = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .bold()
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
        }
    }
}

struct DiceView: View {
    var n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


