//
//  SignInController.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 11/03/2022.
//

import UIKit
import AuthenticationServices



class SignInController: UIViewController , ASAuthorizationControllerDelegate {
    
    @IBOutlet weak var HomeTitle: UILabel!
    @IBOutlet weak var appleView: UIView!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var RemmberMeUI: UISwitch!
    @IBOutlet weak var ForgotPasswordUI: UIButton!
    
    var authenticationVM = AuthenticationVM()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setUI()
    }
    
    func setUI(){
        
        EmailField.delegate = self
        PasswordField.delegate = self
        Utilits.textFieldStyle(textField: EmailField, imageName: "")
        Utilits.textFieldStyle(textField: PasswordField, imageName: "")
        RemmberMeUI.transform = CGAffineTransform(scaleX: 0.75, y: 0.75)
        ForgotPasswordUI.underline()
        hideKeyboardWhenTappedAround()
        signInWithApple()
        
    }
    
    @IBAction func SignInAction(_ sender: Any) {
        Helper.displayLoadingIndicator()
        
        guard let userName = self.EmailField.text else {return}
        guard let password = self.PasswordField.text else {return}
        
        authenticationVM.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                self.HomeTitle.text = "Logged in with username = \(self.authenticationVM.username) and email = \(self.authenticationVM.email)"
            } else {
                self.HomeTitle.text = message
            }
        }
        authenticationVM.authenticateUserWith(userName, andPassword: password)
        hideLoadindIndicator()
    }
        
        
    
    
    // View SignIn with Apple
    @available(iOS 13.0, *)
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
    
    @available(iOS 13.0, *)
    @objc
    func didTapAppleBtn(){
        
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName ,.email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self // ASAuthorizationControllerDelegate
        controller.presentationContextProvider = self // ASAuthorizationControllerPresentationContextProviding
        controller.performRequests()
        
    }
    
}



extension SignInController: ASAuthorizationControllerPresentationContextProviding {
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

