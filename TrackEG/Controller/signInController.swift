//
//  SignInController.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.
//

import UIKit
import AuthenticationServices



class signInController: UIViewController   {
    
    @IBOutlet weak var homeTitle: UILabel!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var remmberMeSwith: UISwitch!
    @IBOutlet weak var forgotPassword: UIButton!
    
    
    var viewModel: signViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        viewModel = signViewModel(delegate: self)
        viewModel.fetchTestData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    func setUI(){
        emailField.delegate = self
        passwordField.delegate = self
        Utilits.textFieldStyle(textField: emailField, imageName: "")
        Utilits.textFieldStyle(textField: passwordField, imageName: "")
        remmberMeSwith.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        forgotPassword.underline()
        hideKeyboardWhenTappedAround()
        signInWithApple()
    }
    
    @IBAction func SignInAction(_ sender: Any) {
        guard let userName = self.emailField.text else {return}
        guard let password = self.passwordField.text else {return}
        if userName.isEmpty {
            AlertManager.showWrongAlertWithMessage(on: self , message: NSLocalizedString("warningEmail", comment: ""))
            return
        }
        if password.isEmpty {
            AlertManager.showWrongAlertWithMessage(on: self , message: NSLocalizedString("warningMobile", comment: ""))
            return
        }
        viewModel.fetchLoginData(email: userName, password: password , vC: self)
    }
}

extension signInController: signViewModelDelegate {
    func onFetchDataModel(with Data: [LoginModel]) {
        print("TheLoginModelIs\(Data)")
    }
    
    func onFetchData(with Data: String) {
        print("The\(Data)")
    }
    
    func onFetchFailed(with reason: String) {
        print("YSta\(reason)")
    }
}


extension signInController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

extension signInController: ASAuthorizationControllerDelegate {
    // View SignIn with Apple
    func signInWithApple(){
        let appleBtn = ASAuthorizationAppleIDButton()
        appleBtn.translatesAutoresizingMaskIntoConstraints = false
        appleBtn.addTarget(self, action: #selector(didTapAppleBtn), for: .touchUpInside)
        self.appleView.addSubview(appleBtn)
        appleBtn.cornerRadius = 6
        NSLayoutConstraint.activate([
        appleBtn.heightAnchor.constraint(equalToConstant: self.appleView.frame.height),
        appleBtn.centerYAnchor.constraint(equalTo: self.appleView.centerYAnchor),
        appleBtn.leadingAnchor.constraint(equalTo: self.appleView.leadingAnchor, constant: 0),
        appleBtn.trailingAnchor.constraint(equalTo: self.appleView.trailingAnchor, constant: 0)
        ])
    }
    
    @objc
    func didTapAppleBtn(){
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName ,.email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        // ASAuthorizationControllerDelegate
        controller.delegate = self
        // ASAuthorizationControllerPresentationContextProviding
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
}

