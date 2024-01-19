//
//  ContentView.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 01/02/2023.
//

import SwiftUI
import AVKit



struct ContentView: View {
    @State var player = AVPlayer()
    @State private var scrollViewContentOffset = CGFloat(0)
    
    var height:CGFloat = 170
    var width:CGFloat = 170
    
    var videoUrl: String = "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"
    var dataModel : EpgDataModel = EpgDataModel()
    
    @State var oldHPos : CGSize = CGSize(width: 0, height: 0)
    @State var newHPos : CGSize = CGSize(width: 0, height: 0)
    
    @State var oldVPos : CGSize = CGSize(width: 0, height: 0)
    @State var newVPos : CGSize = CGSize(width: 0, height: 0)
    
    @State var isHorizontalScroll:Bool = false
    @State var isVerticalScroll:Bool = false
    
    var body: some View {
        GeometryReader { metrics in
            var screenSize = metrics.size
            VStack(alignment: .leading) {
                HStack(alignment: .top, spacing: 10) {
                    VStack(alignment: .leading, spacing: 50) {
                        Label("Zootopia", systemImage: "")
                            .colorMultiply(.white)
                            .font(.title).bold()
                        HStack {
                            Label("1h 48m", systemImage: "timer.circle.fill")
                            Label("English", systemImage: "note.text")
                            Label("CBFC: U", systemImage: "sensor.tag.radiowaves.forward.fill")
                        }.padding()
                            .colorMultiply(.white)
                        .font(.callout).bold()
//                        .border(Color.white, width: 4)
                        HStack {
                            Text("When Judy Hopps, a rookie officer in the Zootopia Police Department, sniffs out a sinister plot, she enlists the help of a con artist to solve the case in order to prove her abilities to Chief Bogo.")
                                .font(.caption)
                                .colorMultiply(.white)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: metrics.size.width * 0.50, minHeight: 0, maxHeight: metrics.size.height * 0.50, alignment: .topLeading)
                    HStack {
                        VideoPlayer(player: player)
                            .onAppear() {
                                player = AVPlayer(url: URL(string: videoUrl)!)
                                player.play()
                            }
                    }
//                    .border(Color.orange, width:6)
                    .frame(minWidth: 0, maxWidth: metrics.size.width * 0.50, minHeight: 0, maxHeight: metrics.size.height * 0.50, alignment: .topLeading)
                }
//                .border(Color.orange, width: 6)
                HStack(alignment: .top, spacing: 10) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            Group {
                                Button("All") {
                                    
                                }
                                .padding()
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
//                                .background(Color.clear, in: RoundedRectangle(cornerRadius: 15))
                                
                                Button("Cinema") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Music") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Dance") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Live") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("News") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Entertainment") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Wildlife") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Nature") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Subscribed") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                            }
                            
                            Group {
                                Button("Favourites") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("History") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Underwater") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                                
                                Button("Ocean life") {
                                    
                                }
                                .buttonStyle(ShowButton(width: 250, height: 40, isRounded: true, isCategory: true, colors: [Color.clear]))
                            }
                        }
                    }
                }
                .coordinateSpace(name: "category")

//                .border(Color.red, width: 10)
//                CustomScrollView(.horizontal, contentOffset: $scrollViewContentOffset) {
                ScrollView(.vertical){
                    HStack(alignment: .top, spacing: 10) {
                        Group() {
                            Button("TODAY") {
                                
                            }
                            .buttonStyle(ShowButton(width: width, height: 50, isRounded: true, isCategory: true, colors: [Color.clear]))
                            
                            Text("12:00 AM").modifier(TimeStrip())
                            
                            Text("12:30 AM").modifier(TimeStrip())
                            
                            Text("01:00 AM").modifier(TimeStrip())
                            
                            Text("01:30 AM").modifier(TimeStrip())
                            
                            Text("02:00 AM").modifier(TimeStrip())
                            
                            Text("02:30 AM").modifier(TimeStrip())
                            
                            Text("03:00 AM").modifier(TimeStrip())
                            
                            Text("03:30 AM").modifier(TimeStrip())
                            
                            Text("04:00 AM").modifier(TimeStrip())
                        }
                        Group {
                            Text("05:00 AM").modifier(TimeStrip())
                            
                            Text("05:30 AM").modifier(TimeStrip())
                            
                            Text("06:00 AM").modifier(TimeStrip())
                            
                            Text("06:30 AM").modifier(TimeStrip())
                            
                            Text("07:00 AM").modifier(TimeStrip())
                            
                            Text("07:30 AM").modifier(TimeStrip())
                            
                            Text("08:00 AM").modifier(TimeStrip())
                            
                            Text("08:30 AM").modifier(TimeStrip())
                            
                            Text("09:00 AM").modifier(TimeStrip())
                            
                            Text("09:30 AM").modifier(TimeStrip())
                        }
                        Group {
                            Text("10:00 AM").modifier(TimeStrip())
                            
                            Text("10:30 AM").modifier(TimeStrip())
                            
                            Text("11:00 AM").modifier(TimeStrip())
                            
                            Text("11:30 AM").modifier(TimeStrip())
                            
                            Text("12:00 PM").modifier(TimeStrip())
                            
                            Text("12:30 PM").modifier(TimeStrip())
                            
                            Text("01:00 PM").modifier(TimeStrip())
                            
                            Text("01:30 PM").modifier(TimeStrip())
                            
                            Text("02:00 PM").modifier(TimeStrip())
                            
                            Text("02:30 PM").modifier(TimeStrip())
                        }
                        Group {
                            Text("03:00 PM").modifier(TimeStrip())
                            
                            Text("03:30 PM").modifier(TimeStrip())
                            
                            Text("04:00 PM").modifier(TimeStrip())
                            
                            Text("04:30 PM").modifier(TimeStrip())
                            
                            Text("05:00 PM").modifier(TimeStrip())
                            
                            Text("05:30 PM").modifier(TimeStrip())
                            
                            Text("06:00 PM").modifier(TimeStrip())
                            
                            Text("06:30 PM").modifier(TimeStrip())
                            
                            Text("07:00 PM").modifier(TimeStrip())
                            
                            Text("07:30 PM").modifier(TimeStrip())
                        }
                        Group {
                            Text("08:00 PM").modifier(TimeStrip())
                            
                            Text("08:30 PM").modifier(TimeStrip())
                            
                            Text("09:00 PM").modifier(TimeStrip())
                            
                            Text("09:30 PM").modifier(TimeStrip())
                            
                            Text("10:00 PM").modifier(TimeStrip())
                            
                            Text("10:30 PM").modifier(TimeStrip())
                            
                            Text("11:00 PM").modifier(TimeStrip())
                            
                            Text("11:30 PM").modifier(TimeStrip())
                        }
                    }
                }
                .preference(key: ScrollOffsetPreferenceKey.self, value: [scrollViewContentOffset * -1])
                //                .offset( CGSize(width: scrollViewContentOffset * -1, height: 0))
                .frame(height:50)
//                .coordinateSpace(name: "time_slots")
                
                HStack(alignment: .top, spacing: 10) {
                    CustomScrollView(.vertical, contentOffset: $scrollViewContentOffset)  {
                        let logoUrl = dataModel.getLogoUrl()
                        var getGrid = GridItems(count: logoUrl.count ?? 0, height: height, spacing: 30)
                        let rows = getGrid.getLogoGridItems()
                        if let logoUrl = logoUrl {
                            let logoCount:Int = logoUrl.count
                            LazyVStack {
                                ForEach(0..<logoCount) {
                                    i in
                                    Button("") {
                                        
                                    }.buttonStyle(LogoButton(width: width, height: height, isRounded: true, imageUrl:logoUrl[i]))
                                }
                            }
                        }
                    }
                    .frame(width:width)
//                    .offset(isVerticalScroll ?  CGSize(width: scrollViewContentOffset * -1, height: 0) : CGSize(width: 0, height: 0))

                    
                
                    CustomScrollView([.horizontal, .vertical], contentOffset: $scrollViewContentOffset)  {
                            VStack(alignment: .leading, spacing: 20) {
                                LazyVStack{
                                    let logoUrl = dataModel.getLogoUrl()
                                    
                                    if let logoUrl = logoUrl {
                                        let show1Url = dataModel.getShow1Imgs()
                                        if let showUrl = show1Url {
                                            let showUrlCount:Int = showUrl.count
                                            LazyHStack {
                                                ForEach(0..<showUrlCount) {  i in
                                                    Button("") {
                                                        
                                                    }
                                                    .buttonStyle(ShowButton(width: 750,
                                                                            height: height,
                                                                            isRounded: true,
                                                                            imageUrl: showUrl[i],
                                                                            colors: [Color( UIColor(hexString: "#212121") ?? UIColor.clear)]))
                                                }
                                            }
                                        }
                                        
                                        let show2Url = dataModel.getShow2Imgs()
                                        if let showUrl = show2Url {
                                            let showUrlCount:Int = showUrl.count
                                            LazyHStack {
                                                ForEach(0..<showUrlCount) {  i in
                                                    Button("") {
                                                        
                                                    }
                                                    .buttonStyle(ShowButton(width: 1000,
                                                                            height: height,
                                                                            isRounded: true,
                                                                            imageUrl: showUrl[i],
                                                                            colors: [Color( UIColor(hexString: "#212121") ?? UIColor.clear)]))
                                                }
                                            }
                                        }
                                        
                                        let show3Url = dataModel.getShow3Imgs()
                                        if let showUrl = show3Url {
                                            let showUrlCount:Int = showUrl.count
                                            LazyHStack {
                                                ForEach(0..<showUrlCount) {  i in
                                                    Button("") {
                                                        
                                                    }
                                                    .buttonStyle(ShowButton(width: 750,
                                                                            height: height,
                                                                            isRounded: true,
                                                                            imageUrl: showUrl[i],
                                                                            colors: [Color( UIColor(hexString: "#212121") ?? UIColor.clear)]))
                                                }
                                            }
                                        }
                                        
                                        let show4Url = dataModel.getShow4Imgs()
                                        if let showUrl = show4Url {
                                            let showUrlCount:Int = showUrl.count
                                            LazyHStack {
                                                ForEach(0..<showUrlCount) {  i in
                                                    Button("") {
                                                        
                                                    }
                                                    .buttonStyle(ShowButton(width: 750,
                                                                            height: height,
                                                                            isRounded: true,
                                                                            imageUrl: showUrl[i],
                                                                            colors: [Color( UIColor(hexString: "#212121") ?? UIColor.clear)]))
                                                }
                                            }
                                        }
                                        
                                        let show5Url = dataModel.getShow5Imgs()
                                        if let showUrl = show5Url {
                                            let showUrlCount:Int = showUrl.count
                                            LazyHStack {
                                                ForEach(0..<showUrlCount) {  i in
                                                    Button("") {
                                                        
                                                    }
                                                    .buttonStyle(ShowButton(width: 750,
                                                                            height: height,
                                                                            isRounded: true,
                                                                            imageUrl: showUrl[i],
                                                                            colors: [Color( UIColor(hexString: "#212121") ?? UIColor.clear)]))
                                                }
                                            }
                                        }
                                        
                                        let show6Url = dataModel.getShow6Imgs()
                                        if let showUrl = show6Url {
                                            let showUrlCount:Int = showUrl.count
                                            LazyHStack {
                                                ForEach(0..<showUrlCount) {  i in
                                                    Button("") {
                                                        
                                                    }
                                                    .buttonStyle(ShowButton(width: 750,
                                                                            height: height,
                                                                            isRounded: true,
                                                                            imageUrl: showUrl[i],
                                                                            colors: [Color( UIColor(hexString: "#212121") ?? UIColor.clear)]))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            //.border(Color.yellow, width:2)
                        }//( horizontal scroll)
                        .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: { value in
//                            isHorizontalScroll = true
//                            isVerticalScroll = false
//                            newHPos = CGSize(width: scrollViewContentOffset * -1, height: 0)
//                            if oldHPos != newHPos {
//                                newHPos = oldHPos
//                            }
                           print("=====time offset====== :\(scrollViewContentOffset) | \(value)")
                        })
                }
//                .border(Color.green, width:2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






 
