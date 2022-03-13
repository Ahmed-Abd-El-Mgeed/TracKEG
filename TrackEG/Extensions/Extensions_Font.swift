//
//  Extensions_Fonts.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit


//This connects with the XIB and storyboards to add the font of label
@IBDesignable
class LabelFont: UILabel {
    
    @IBInspectable var FontSize : CGFloat = 18 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var isBold : Bool = false {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        if isBold {
            self.font = AppFontManager.fontType(type: .acumin, size: FontSize, weight: .extraBold)
        }else{
            self.font = AppFontManager.fontType(type: .acumin, size: FontSize, weight: .extra)
        }
    }
}

//This connects with the XIB and storyboards to add the font of buttons
@IBDesignable
class ButtonFont: UIButton {
    
    @IBInspectable var FontSize : CGFloat = 18 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var isBold : Bool = false {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        if isBold {
            self.titleLabel?.font = AppFontManager.fontType(type: .acumin, size: FontSize, weight: .extraBold)
        }else{
            self.titleLabel?.font = AppFontManager.fontType(type: .acumin, size: FontSize, weight: .extra)
        }
    }
}
