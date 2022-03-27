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





protocol SignViewModelDelegate {
    func onFetchDataModel(with Data: [LoginModel])
    func onFetchData(with Data: String)
    func onFetchFailed(with reason: String)
}

public class SignViewModel {
    
    
    private var loginModelSubject = PublishSubject<LoginModel>()
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    

    var loginModelObservable: Observable<LoginModel> {
        return loginModelSubject
    }
  
    
    //delegate to connect the viewModel with View
    var delegate: SignViewModelDelegate!

    init(delegate: SignViewModelDelegate) {
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
       // Helper.displayLoadingIndicator()
        loadingBehavior.accept(true)
        trackEgApi.LoginAPi(email: email , password: password) { (result) in
            switch result {
            case .failure(let error):
                let theError = error.reason
                print("theError\(theError)")
                break
            case .success(let loginData):
                let checkStautes = loginData.status
                print("ShowTheData\(checkStautes)")
                if checkStautes == false {
                    AlertManager.showWrongAlertWithMessage(on: vC , message: loginData.welcomeDescription)
                } else {
                    self.loginModelSubject.onNext(loginData)
                    
                    self.delegate.onFetchFailed(with: "\(checkStautes)")
                    self.delegate.onFetchDataModel(with: [loginData])
                }
                break
            }
        }
       // Helper.hideLoadindIndicator()
        self.loadingBehavior.accept(false)
    }
}


