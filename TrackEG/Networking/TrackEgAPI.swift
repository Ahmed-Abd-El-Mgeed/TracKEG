//
//  MoviesAPI.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftUI

class trackEgApi : NSObject {
    
    //get Login
    class func LoginAPi(email: String , password: String ,completion: @escaping (Result<LoginModel, DataResponseError>) -> Void) {
        let url = EndPoints.LoginUrl

        let parameters: [String: Any] = [
            "LoginAccount" : email,
            "Password" : password ,
        ]

        AF.request(url, method: .post, parameters: parameters,  encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).validate().responseDecodable(of: LoginModel.self) { (response) in
            
            switch response.result
            {
            case .failure(let error):
                completion(Result.failure(DataResponseError.network))
                print(error)
            case .success( _):
                print("Login loading is \(String(describing: response.value))")
                guard let value = response.value else {
                    completion(Result.failure(DataResponseError.decoding))
                    return
                }
                completion(Result.success(value))
            }
        }
    }
    
}

