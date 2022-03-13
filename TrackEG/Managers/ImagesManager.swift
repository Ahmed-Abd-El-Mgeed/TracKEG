//
//  ImagesManager.swift
//  TrackEG
//
//  Created by Other Logic on 12/2/20.
//  Copyright © 2020 Odiggo. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

public class ImagesManager {
    public static func setImage(url: String, image: UIImageView){
        
        let url = URL(string: IMAGEURL + url)
        let processor = DownsamplingImageProcessor(size: image.bounds.size)
                     |> RoundCornerImageProcessor(cornerRadius: 0)
        image.kf.indicatorType = .activity
        image.kf.setImage(
            with: url,
            placeholder: UIImage(named: "placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
    }
}
