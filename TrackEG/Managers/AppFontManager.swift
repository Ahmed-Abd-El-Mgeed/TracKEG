//
//  AppFontManager.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import Foundation


import UIKit

enum AppFontWeight: String {
    case bold = "Bold"
    case medium = "Medium"
    case regular = "Regular"
    case extra = "ExtraCond"
    case extraBold = "ExtraCondBold"
}

enum AppFontType: String {
    case acumin =  "AcuminConcept"
}

class AppFontManager: NSObject {
    
    static func fontType(type: AppFontType ,size: CGFloat, weight: AppFontWeight) -> UIFont {
        let name = type.rawValue + "-" + weight.rawValue
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
}
