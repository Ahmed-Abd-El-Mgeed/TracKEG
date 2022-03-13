//
//  LoginModel.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.
//

import Foundation

struct LoginModel: Codable {
    
    let status: Bool
    let welcomeDescription: String
    let userID, roleID: Int
    let loginAccount, token: String?

    enum CodingKeys: String, CodingKey {
        case status
        case welcomeDescription = "description"
        case userID = "userId"
        case roleID = "roleId"
        case loginAccount, token
    }
}
