//
//  EpgDataModel.swift
//  SampleEPGWithSwiftUI
//
//  Created by Sweda Thiyagarajan on 27/02/2023.
//

import Foundation

class EpgDataModel {
  
    var logoUrl:[String] = [
        "https://v2s3z9v2.stackpathcdn.com/videos/5940/24-11-2022/CBS__1YC4BSXR640x640.jpg",
        "https://v2s3z9v2.stackpathcdn.com/videos/5940/19-12-2022/SR__M3UN4CXG800x800.jpg",
        "https://v2s3z9v2.stackpathcdn.com/videos/5940/24-11-2022/CBS__1YC4BSXR640x640.jpg",
        "https://v2s3z9v2.stackpathcdn.com/videos/5940/19-12-2022/SR__M3UN4CXG800x800.jpg",
        "https://v2s3z9v2.stackpathcdn.com/videos/5940/24-11-2022/CBS__1YC4BSXR640x640.jpg"
    ]
    
    var show1Imgs:[String] = [
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg"
    ]
    var show2Imgs:[String] = [
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg"
    ]
    var show3Imgs:[String] = [
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg"
    ]
    var show4Imgs:[String] = [
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg"

    ]
    var show5Imgs:[String] = [
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg"

    ]
    var show6Imgs:[String] = [
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001370_Cholos_Try_301/Mitu_0001370_Cholos_Try_301.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise/Mitu_0001396_Season_3_Premiere_of_Conciencia_Talk_about_Women_in_Power_and_POC_on_the_rise.jpg",
        "https://ventuno.contentbridge.tv/Mitu_0001384_Te_(quila)_Te_(quiero)/Mitu_0001384_Te_(quila)_Te_(quiero).jpg"

    ]
    
    func getLogoUrl () -> [String] {
        
        return logoUrl
    }
    
    func getShow1Imgs() -> [String] {
        return show1Imgs
    }
    
    func getShow2Imgs() -> [String] {
        return show2Imgs
    }
    
    func getShow3Imgs() -> [String] {
        return show3Imgs
    }
    
    func getShow4Imgs() -> [String] {
        return show4Imgs
    }
    
    func getShow5Imgs() -> [String] {
        return show5Imgs
    }
    
    func getShow6Imgs() -> [String] {
        return show6Imgs
    }

}


