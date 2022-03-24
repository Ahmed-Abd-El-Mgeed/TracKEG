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
      return NSLocalizedString("reasonNetwork", comment: "")
    case .decoding:
      return NSLocalizedString("reasonDecoding", comment: "")
    case .problem:
        return NSLocalizedString("reasonProblem", comment: "")
    case .empty:
        return NSLocalizedString("reasonEmpty", comment: "")
    }
  }
}


