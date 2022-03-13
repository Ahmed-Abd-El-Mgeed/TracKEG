//
//  TestModel.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.
//

import Foundation


// MARK: - Welcome

struct TestModel: Codable {
    let updateTime: String
    let receivedDate: String?
    let speed, path: String
    let latitude, longitude: Double
    let parking: Bool
    let parkingTime, offlineFrom: String?
    let online: Bool
    let status: String
    let engine: Bool
    let battery: String
    let defense, exBattery: Bool
    
}



struct User {
    var userName:String
    var email:String
}
