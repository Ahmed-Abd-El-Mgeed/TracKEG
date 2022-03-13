//
//  Helper.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit
import KRProgressHUD

public class Helper {

    //Thats to add corner only in left and right view
    static func cornerLeftRight(view: UIView, radious: CGFloat){
        if #available(iOS 11.0, *){
            view.layer.masksToBounds = true
            view.clipsToBounds = true
            view.layer.cornerRadius = radious
            view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        }
    }
    
    //Thats get current dateTime
    static func currentDateTime() -> String{
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        let interval = date.timeIntervalSince1970
        return "\(dateString) \(interval)"
    }
    
    //Display Loading indicator
    static func displayLoadingIndicator(){
        KRProgressHUD.set(style: .custom(background: .white, text: .black, icon: .black))
                      .set(maskType: .black)
                      .show()
    }
    
    //Hide Loading indicator
    static func hideLoadindIndicator(){
        DispatchQueue.main.async {
            KRProgressHUD.dismiss()
        }
    }
}
