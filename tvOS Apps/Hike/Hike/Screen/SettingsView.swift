//
//  SettingsView.swift
//  Hike
//
//  Created by Sweda Thiyagarajan on 13/12/2023.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - Properties
    private let alternateAppIcons : [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    
    var body: some View {
        List {
            
            //MARK: - section: header
           Section {
                HStack {
                    Spacer()
                    
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack (spacing: -10){
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            .customGreenLight,
                            .customGreenMedium,
                            .customGreenDark
                        ],
                        startPoint: .top,
                        endPoint: .bottom)
                )
                .padding(.top, 8)
               VStack (spacing: 8){
                   Text("Where can you find \nperfect tacks?")
                       .font(.title2)
                       .fontWeight(.heavy)
                   
                   Text("Hike looks gorgeous in photos but its even better when you are actually there. The hike that you hope to do again someday. \n Find the best day hikes in the app")
                       .font(.footnote)
                       .italic()
                   
                   Text("Dust off the boots, Its time for a walk!")
                       .fontWeight(.heavy)
                       .foregroundColor(.customGreenMedium)
               }
               .multilineTextAlignment(.center)
               .padding(.bottom, 16)
               .frame(maxWidth: .infinity)
            }//: header
            .listRowSeparator(.hidden)
           
            //MARK: - section: icons
            Section(header: Text("Alter app icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack (spacing: 12){
                        ForEach(alternateAppIcons.indices, id:\.self) { item in
                            Button{
                                print("Icon \(alternateAppIcons[item]) was pressed")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]) {
                                    error in
                                        if error != nil {
                                            print("Failed to update icon \(error.debugDescription) ")
                                        } else {
                                            print ("Icon updated")
                                        }
                                    
                                    
                                }
                            } label: {
                                Image("\(alternateAppIcons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } .padding(.top, 12)
                
                Text("Choose your favourite icon from the collection below:")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }
            .listRowSeparator(.hidden)
            //MARK: - section: about
            Section (
                header:  Text("About the app"),
                footer: HStack {
                    Spacer()
                    Text("Copyright @ All right reserved")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                //1. Basic label content
                //                LabeledContent("Application", value: "Hike")
                
                //2. Advanced label content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatiblity", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "JohnCoe", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .indigo, rowLinkLabel: "https://netflix.com", rowLinkDestination: "https://netflix.com")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
