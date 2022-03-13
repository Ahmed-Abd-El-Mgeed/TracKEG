//
//  SplashController.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.
//

import UIKit
import Alamofire

class SplashController: UIViewController {
    
    @IBOutlet weak var SplashImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        TrackEgApi.TesTAPi() { (result) in
            Helper.hideLoadindIndicator()
            switch result {
            case .failure(let error):

                break
            case .success(let TestData):
              
                let Test = TestData.longitude
                print("CCCCCC\(Test)")
                
                break
            }
        }
        
        TrackEgApi.LoginAPi() { (result) in
            Helper.hideLoadindIndicator()
            switch result {
            case .failure(let error):

                break
            case .success(let TestData):
              
                let Test = TestData.status
                print("DDDDDDD\(Test)")
                
                break
            }
        }
    
        
 
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUI()
        ToSignInVc()
    }
    
    func setUI() {
        SplashImage.loadGif(name: "ford-mustang-ford")
    }
    
    func ToSignInVc(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            NavigationManager.tosignIn(self)
        })
    }
    
}

