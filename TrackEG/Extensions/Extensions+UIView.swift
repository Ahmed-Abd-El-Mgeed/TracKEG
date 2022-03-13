//
//  Extensions+UIView.swift
//  TrackEG
//
//  Created by Other Logic on 12/3/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import Foundation

import UIKit


//thats to add gradient to view and its IBDesignable
@IBDesignable
class CustomGradient: UIView {
    
    @IBInspectable var FirstColor : UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var SecondColor : UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    override class var layerClass : AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let Layer = self.layer as! CAGradientLayer
        Layer.colors = [FirstColor.cgColor , SecondColor.cgColor]
    }
    
}


@IBDesignable
class CustomButton: UIView {
    
    @IBInspectable var FirstColor : UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable var SecondColor : UIColor = UIColor.clear {
        didSet{
            updateView()
        }
    }
    
    override class var layerClass : AnyClass {
        get{
            return CAGradientLayer.self
        }
    }
    
    func updateView() {
        let Layer = self.layer as! CAGradientLayer
        Layer.colors = [FirstColor.cgColor , SecondColor.cgColor]
    }
    
}

//Thats make cardview but it connected to the XIB and storyboards
extension UIView{
    
    @IBInspectable var CornerRaduis : CGFloat {
        get{ return self.layer.cornerRadius}
        set{ self.layer.cornerRadius = newValue}
    }
    
    @IBInspectable var shadowOffsetWidth : CGFloat {
        get{ return self.layer.shadowOffset.width}
        set{ self.layer.shadowOffset.width = newValue}
    }
    
    @IBInspectable var shadowOffsetHeight : CGFloat {
        get{ return self.layer.shadowOffset.height}
        set{ self.layer.shadowOffset.height = newValue}
    }
    
    @IBInspectable var shadowOpacity : CGFloat {
        get{ return CGFloat(self.layer.shadowOpacity)}
        set{ self.layer.shadowOpacity = Float(newValue)}
    }
    
    @IBInspectable var shadowColor : UIColor {
        get{ return UIColor( cgColor : self.layer.shadowColor!)}
        set{ self.layer.shadowColor = newValue.cgColor}
    }
    
    @IBInspectable var BorderWidth : CGFloat {
        get{ return self.layer.borderWidth}
        set{ self.layer.borderWidth = newValue}
    }
    
    @IBInspectable var BorderColor : UIColor {
        get{ return UIColor( cgColor : self.layer.borderColor!)}
        set{ self.layer.borderColor = newValue.withAlphaComponent(0.3).cgColor}
    }
    
}
