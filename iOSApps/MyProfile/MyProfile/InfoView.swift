//
//  InfoView.swift
//  MyProfile
//
//  Created by Sweda Thiyagarajan on 26/10/2021.
//

import SwiftUI

struct InfoView: View {
    let text: String
    let image: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color("Info Color"))
            .frame(height: 50)
            .overlay(HStack {
                Image(systemName: image)
                    .foregroundColor(Color("Info Color"))
                Text(text)
                    .font(.system(size: 30))
                    .aspectRatio(contentMode: .fill)
            })
            .padding(.all)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(text: "Hello", image: "eyes")
            .previewLayout(.sizeThatFits)
    }
}
