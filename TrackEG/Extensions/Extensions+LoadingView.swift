//
//  Extensions+LoadingView.swift
//  TrackEG
//
//  Created by Other Logic on 12/4/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit
import KRProgressHUD

//Loading Indicator
extension UIViewController {
    func displayLoadingIndicator(){
        KRProgressHUD.show()
    }
    
    func hideLoadindIndicator(){
        
        DispatchQueue.main.async {
            KRProgressHUD.dismiss()
        }
    }
}

