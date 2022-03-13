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

class TrackEgApi : NSObject {
    
    //get TesT
    class func TesTAPi(completion: @escaping (Result<TestModel, DataResponseError>) -> Void) {
      //  let parameters = ["api_key": APIKEY]
        let url = "https://www.utrackingme.com/ims/api/gps/getlastpopupinfo/18682"
        
        AF.request(url, method: .get,  encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).validate().responseDecodable(of: TestModel.self) { (response) in
            
            switch response.result
            {
            case .failure(let error):
                completion(Result.failure(DataResponseError.network))
                print(error)
            case .success( _):
                print("Data loading is \(String(describing: response.value))")
                guard let value = response.value else {
                    completion(Result.failure(DataResponseError.decoding))
                    return
                }
                completion(Result.success(value))
            }
        }
    }
    
    
    //get Login
    class func LoginAPi(completion: @escaping (Result<LoginModel, DataResponseError>) -> Void) {
        let url = "https://www.utrackingme.com/ims/api/account/login"
        
        
        let parameterss = [
            
        "LoginAccount": "LoginAccount" ,
        "Password": "Password"
        
         ]
        
        let parameters: [String: Any] = [
            "LoginAccount" : "LoginAccount",
            "Password" : "Password",
            
         
        ]

//        AF.request("https://www.utrackingme.com/ims/api/account/login", method: .post, parameters: parameterss, encoding: JSONEncoding.default)
//            .responseJSON { response in
//                print(response)
//                print("DFDFDFFFF")
//            }
        
        
        
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

