//
//  Box.swift
//  TrackEG
//
//  Created by Other Logic on 12/3/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//
import Foundation

//Thats listenrs like delegate
final class Box<T> {
    
  typealias Listener = (T) -> Void
  var listener: Listener?

  var value: T {
    didSet {
      listener?(value)
    }
  }

  init(_ value: T) {
    self.value = value
  }

  func bind(listener: Listener?) {
    self.listener = listener
    listener?(value)
  }
}
