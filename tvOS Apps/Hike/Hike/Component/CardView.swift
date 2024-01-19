//
//  CardView.swift
//  Hike
//
//  Created by Sweda Thiyagarajan on 12/12/2023.
//

import SwiftUI

struct CardView: View {
    // Mark: - PROPERTIES
    @State private var imageNumber : Int = 1
    @State private var randomNumber : Int = 4
    @State private var isShowingSheet : Bool = false
    
    //Mark: - FUNCTIONS
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("random no: \(randomNumber)")
        } while randomNumber == imageNumber
       
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                //MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [.customGrayMedium, .customGrayMedium],
                                    startPoint: .top,
                                    endPoint: .bottom)
                        )
                        Spacer()
                        Button{
                            print("Button pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet){
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activites for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic().foregroundColor(.customGrayMedium)
                } //: Header
                .padding(.horizontal, 30)
                
                //MARK: - Main content
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                    .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                
                //MARK: - Footer
                Button {
                    print("Exploring")
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    .customGreenLight,
                                    .customGreenMedium],
                                startPoint: .top,
                                endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1 ,y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
