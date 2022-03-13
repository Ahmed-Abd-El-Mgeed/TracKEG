//
//  Extensions+AlertDisplayer.swift
//  TrackEG
//
//  Created by Other Logic on 12/3/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import Foundation
import UIKit

//This displayer to display alert with messages and actions and connected
//With ViewController
protocol AlertDisplayer {
  func displayAlert(with title: String, message: String, actions: [UIAlertAction]?)
}

extension AlertDisplayer where Self: UIViewController {
  func displayAlert(with title: String, message: String, actions: [UIAlertAction]? = nil) {
    guard presentedViewController == nil else {
      return
    }
    
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    actions?.forEach { action in
      alertController.addAction(action)
    }
    present(alertController, animated: true)
  }
}



