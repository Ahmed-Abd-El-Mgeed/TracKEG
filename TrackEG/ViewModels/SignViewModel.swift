//
//  SignViewModel.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 23/03/2022.
//



import Foundation
import UIKit
import RxSwift
import RxCocoa



protocol signViewModelDelegate {
    func onFetchDataModel(with Data: [LoginModel])
    func onFetchData(with Data: String)
    func onFetchFailed(with reason: String)
}

public class signViewModel {
    

    
    //delegate to connect the viewModel with View
    var delegate: signViewModelDelegate!

    init(delegate: signViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetchTestData(){
        self.delegate.onFetchData(with: "AhmedAbdElMgeed")
    }
    
    //API fetch the Login and delegate the View to display the movies
    func fetchLoginData(email: String , password: String , vC: UIViewController){
        if !Connectivity.isConnectedToInternet {
            AlertManager.showWrongAlertWithMessage(on: vC , message: NSLocalizedString("internet_failed", comment: ""))
            return
        }
        Helper.displayLoadingIndicator()
        trackEgApi.LoginAPi(email: email , password: password) { (result) in
            switch result {
            case .failure(let error):
                let theError = error.reason
                print("theError\(theError)")
                break
            case .success(let testData):
                let checkStautes = testData.status
                print("ShowTheData\(checkStautes)")
                if checkStautes == false {
                    AlertManager.showLoginMobileFailed(on: vC)
                } else {
                   self.delegate.onFetchFailed(with: "\(checkStautes)")
                   self.delegate.onFetchDataModel(with: [testData])
                }
                break
            }
        }
        Helper.hideLoadindIndicator()
    }
    
    

    
}


