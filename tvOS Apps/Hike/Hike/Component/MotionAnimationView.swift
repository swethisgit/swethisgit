//
//  MotionAnimationView.swift
//  Hike
//
//  Created by Sweda Thiyagarajan on 13/12/2023.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: - Prop
    
    @State private var randomCircle : Int = Int.random(in: 1...6)
    @State private var isAnimating : Bool = false
    
    //MARK:- func
    
    //MARK:-  Coordinate
    func randomCoordinate() -> CGFloat {
        return CGFloat.random(in: 1...256)
    }
    
    //MARK:-  size
    func randomSize() -> CGFloat {
        return CGFloat.random(in: 4...80)
    }
    
    //MARK:- scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 1.0...2.0))
    }
    
    //MARK:- speed
    func randomSpped() -> CGFloat {
        return CGFloat(Double.random(in: 0.05...1.0))
    }
    
    //MARK:- delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.5)
                    .frame(width: randomSize())
                    .position(
                        x: randomCoordinate(),
                        y:randomCoordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(mass: 0.5, stiffness: 0.2, damping: 0.25, initialVelocity: 0.25)
                            .repeatForever()
                            .speed(randomSpped())
                            .delay(randomDelay()))
                        {
                            isAnimating.toggle()
                        }
                    })
            }
        }
        .frame(width: 256, height: 256)
        
    }
}

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
                        
            MotionAnimationView()
                .background(Circle().fill(.teal))
        }
    }
}
