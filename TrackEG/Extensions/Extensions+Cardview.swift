//
//  Extensions+Cardview.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit

//This extensions help to make card view design to cell of cellection view
extension UIView{
    
    func shadowAndBorderForCell(cell : UICollectionViewCell, radius: CGFloat){
        // SHADOW AND BORDER FOR CELL
        cell.contentView.layer.cornerRadius = radius
        cell.contentView.layer.borderWidth = 0
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.masksToBounds = true
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
    }
    
    func shadowAndBorderForImageView(cell : UIView, cornerRadious: Int){
        // SHADOW AND BORDER FOR CELL
        cell.layer.cornerRadius = CGFloat(cornerRadious)
        cell.layer.borderWidth = 0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        cell.layer.shadowRadius = 2.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = true
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.layer.cornerRadius).cgPath
    }
}
