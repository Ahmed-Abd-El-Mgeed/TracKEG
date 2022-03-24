//
//  NavigationManager.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit

public class NavigationManager {
    
    static func toSplash(_ vc: UIViewController){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let desVC = mainStoryboard.instantiateViewController(withIdentifier: "SplashController") as? SplashController {
            vc.present(desVC, animated: true)
        }
    }

    static func tosignIn(_ vc: UIViewController){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        if let desVC = mainStoryboard.instantiateViewController(withIdentifier: "signInController") as? signInController {
            desVC.modalPresentationStyle = .fullScreen
            vc.present(desVC, animated: true)
        }
    }
    
}
