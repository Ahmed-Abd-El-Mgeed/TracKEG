//
//  Connectivity.swift
//  Tracking
//
//  Created by Ahmed Abd El mged on 08/03/2022.
//

import Foundation
import Alamofire

class Connectivity {
    class var isConnectedToInternet:Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}
