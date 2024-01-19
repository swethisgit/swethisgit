//
//  ContentView.swift
//  AsyncImage
//
//  Created by Sweda Thiyagarajan on 11/12/2023.
//

import SwiftUI

extension Image {
    func imageModifier() -> some View {
        self.resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self.imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
    
}

struct ContentView: View {
    private let imageURL = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        VStack {
          //  AsyncImage(url: URL(string: imageURL))
            
            //Modifiers
            
            /*AsyncImage(url : URL(string: imageURL) ) { image in
                image
                    .imageModifier()
            } placeholder: {
                Image(systemName: "photo.circle")
                    .iconModifier()
            }
            .padding(40)*/
            
            //Phases
            
//            AsyncImage(url : URL(string: imageURL) ) { phase in
//                //Success
//                if let image = phase.image {
//                    image.imageModifier()
//                }
//                //Failure
//                else if phase.error != nil {
//                    Image(systemName: "ant.circle.fill").iconModifier()
//                }
//                //Empty
//                else {
//                    Image(systemName: "photo.circle.fill").iconModifier()
//                }
            //}
            
            //Animation
            
            AsyncImage(url : URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))  ) { phase in
                switch phase {
                    case .success(let image):
                        image.imageModifier()
                          //  .transition(.move(edge: .bottom))
//                            .transition(.slide)
                            .transition(.scale)
                    case .failure(_):
                        Image(systemName: "ant.circle.fill").iconModifier()
                    case .empty:
                        Image(systemName: "photo.circle.fill").iconModifier()
                    @unknown default:
                       ProgressView()
                }
            }
            .padding(40)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
