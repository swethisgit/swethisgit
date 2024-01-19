//
//  ContentView.swift
//  LazyGridPOC
//
//  Created by Sweda Thiyagarajan on 23/02/2023.
//

import SwiftUI

struct ContentView: View {
    let rows = [
        GridItem(.fixed(150), spacing: 10),
        GridItem(.fixed(150), spacing: 10),
        GridItem(.fixed(150), spacing: 10),
        GridItem(.fixed(150), spacing: 10),
        GridItem(.fixed(150), spacing: 10)
    ]
    let url = URL(string: "https://image.tmdb.org/t/p/original/pThyQovXQrw2m0s9x82twj48Jq4.jpg")!
    var body: some View {
       
        ScrollView(.horizontal) {
            LazyHStack{
                ForEach(0...4, id: \.self) { item in
                    Button("\(item)") {

                    }
                }
            }
            LazyVGrid(columns: rows, spacing: 10) {
                ForEach(0...4, id: \.self) { item in
                    Button("\(item)") {

                    }
                }
            }

//            .frame(width: 530, height: 150)
            .border(.orange, width:7)


//            LazyHGrid(rows: rows, spacing: 5) {
//                ForEach(0...4, id: \.self) { item in
//                    Button("\(item)"){
//
//                    }
//
//                }
//            }.border(.orange, width:7)
            AsyncImage(url: url,
                       placeholder: { Text("Loading ...") }
            ).aspectRatio(contentMode: .fit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
