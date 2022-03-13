//
//  Result.swift
//  TrackEG
//
//  Created by Other Logic on 12/3/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import Foundation

//Thats cases of api result
enum Result<T, U: Error> {
  case success(T)
  case failure(U)
}
