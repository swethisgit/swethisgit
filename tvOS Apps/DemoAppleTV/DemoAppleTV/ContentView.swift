//
//  ContentView.swift
//  DemoAppleTV
//
//  Created by Sweda Thiyagarajan on 18/11/2023.
//

import SwiftUI

struct ContentView: View {
    @State var showImage:Bool = true
    @State var imageName : String = "star"
    private let urlString = "https://developer.apple.com/news/images/og/swiftui-og.png"
    private var screenSize:CGSize?
    var body: some View {
        GeometryReader { geomentry in
            
            ZStack {
                var deviceFrameHPadding:CGFloat = 80
                var deviceFrameVPadding:CGFloat = 60
                
                Text("Page dimensions:  W:\(geomentry.size.width), H:\(geomentry.size.height)" ).zIndex(1000)
                    .foregroundColor(.black)
                
               

                // Page full background
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: geomentry.size.width, height: geomentry.size.height)
                    .position(x:geomentry.size.width/2, y:geomentry.size.height/2)
                    .zIndex(10)
                
                // Top menu
                Rectangle()
                    .fill(Color.green)
                    .position(x: 50, y: -440)
                    .frame(width: geomentry.size.width/2, height: 50)
                    .zIndex(100)
                
               
                
                //Preview pane
                var previewPaneHeight:CGFloat = 500
                var previewPaneYPos:CGFloat = previewPaneHeight - (geomentry.size.height/2)
                
                
                Rectangle()
                    .fill(Color.red)
                    .position(x: geomentry.size.width/2, y: previewPaneYPos)
                    .frame(width: 1920, height: previewPaneHeight)
                    .zIndex(50)
                
                //Page content view
               
                var pageContentViewHeight:CGFloat = geomentry.size.height-previewPaneHeight
                var pageContentViewYPos:CGFloat = geomentry.size.height/2
                
                
                Rectangle()
                    .fill(Color.yellow)
                    .position(x: geomentry.size.width/2, y: pageContentViewYPos)
                    .frame(width:  geomentry.size.width, height: pageContentViewHeight)
                    .zIndex(100)
                
                
            }
        }.padding(.horizontal, -80)
            .padding(.vertical, -60)
        
    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
