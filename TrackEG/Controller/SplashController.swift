//
//  SplashController.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.
//

import UIKit
import Alamofire

class SplashController: UIViewController {
    
    @IBOutlet weak var splashImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUi()
        toSignInVc()
    }
    
    func setUi() {
        splashImage.loadGif(name: "ford-mustang-ford")
    }
    
    func toSignInVc(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            NavigationManager.tosignIn(self)
        })
    }
    
}

