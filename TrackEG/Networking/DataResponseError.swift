//
//  DataResponseError.swift
//  TrackEG
//
//  Created by Other Logic on 12/3/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import Foundation

//Data response errors used to pass the error
enum DataResponseError: Error {
  case network
  case decoding
  case problem
  case empty
  
  var reason: String {
    switch self {
    case .network:
      return "An error occurred while fetching data "
    case .decoding:
      return "An error occurred while decoding data"
    case .problem:
        return "An error occurred while fetch data"
    case .empty:
        return "There are no data avalible"
    }
  }
}
