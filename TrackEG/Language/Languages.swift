//
//  Languages.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.//

import UIKit

// constants
let APPLE_LANGUAGE_KEY = "AppleLanguages"
/// L102Language
class L102Language {
    
    /// get current Apple language
    class func currentAppleLanguage() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        let endIndex = current.startIndex
        let currentWithoutLocale = current.substring(to: current.index(endIndex, offsetBy: 2))
        //print("langauge aaa \(current)   \(langArray[1])")
        return currentWithoutLocale
    }
    
    class func currentAppleLanguageFull() -> String{
        let userdef = UserDefaults.standard
        let langArray = userdef.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
        let current = langArray.firstObject as! String
        return current
    }
    
    /// set @lang to be the first in Applelanguages list
    class func setAppleLAnguageTo(lang: String) {
        let userdef = UserDefaults.standard
        userdef.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
        userdef.synchronize()
    }
    
    class var isRTL: Bool {
        return L102Language.currentAppleLanguage() == "ar"
    }
}
