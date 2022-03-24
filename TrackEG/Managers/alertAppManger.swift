//
//  alertAppManger.swift
//  TrackEG
//
//  Created by Ahmed Abd El mged on 23/03/2022.
//

import Foundation
import UIKit
import PMAlertController

public class AlertManager {
    private static func oneAction(on vc: UIViewController, mTitle: String,
                                  mActionTitle: String,mMessage: String) {
        
        let alertVC = PMAlertController(title: mTitle, description: mMessage, image: UIImage(named: "logo22.png"), style: .alert)
        
        alertVC.addAction(PMAlertAction(title: mActionTitle, style: .cancel, action: { () -> Void in
            print("Capture action Cancel")
        }))
        
        vc.present(alertVC, animated: true, completion: nil)
    }
    
    private static func oneActionWithDismiss(on vc: UIViewController, mTitle: String,
                                             mActionTitle: String,mMessage: String) {
        
        let alertVC = PMAlertController(title: mTitle, description: mMessage, image: UIImage(named: "logo22.png"), style: .alert)
        
        alertVC.addAction(PMAlertAction(title: mActionTitle, style: .cancel, action: { () -> Void in
            vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alertVC, animated: true, completion: nil)
    }
    
    class func oneActionWithResponse(on vc: UIViewController, message: String ,completion: @escaping (_ success: Bool)->Void) {
        
        let alertVC = PMAlertController(title: NSLocalizedString("warning", comment: "warning"), description: message, image: UIImage(named: "logo22.png"), style: .alert)
        
        alertVC.addAction(PMAlertAction(title:  NSLocalizedString("ok", comment: "ok"), style: .cancel, action: { () -> Void in
            completion(true)
        }))
        
        vc.present(alertVC, animated: true, completion: nil)
    }
    
    static func showWrongAlert(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning") , mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: NSLocalizedString("wrong_message", comment: "wrong_message"))
    }
    
    static func showPaymentWrongAlert(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning") , mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: NSLocalizedString("payment_failed", comment: "payment_failed"))
    }
    
    static func showWrongAlertWithMessage(on vc: UIViewController, message: String){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning") , mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: message)
    }
    
    static func showSuccessAlertWithMessage(on vc: UIViewController, message: String){
        oneAction(on: vc, mTitle: NSLocalizedString("success", comment: "success") , mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: message)
    }
    
    static func showLoginMobileFailed(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("wrong", comment: "wrong"), mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: NSLocalizedString("wrong_email_or_password", comment: ""))
    }
    
    static func showInvalidPassword(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("wrong", comment: "wrong"), mActionTitle: NSLocalizedString("submit", comment: "submit"), mMessage: NSLocalizedString("minimum_password_length", comment: ""))
    }
    
    static func showConfirmPassword(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("wrong", comment: "wrong"), mActionTitle: NSLocalizedString("submit", comment: "submit"), mMessage: NSLocalizedString("confirm_password", comment: ""))
    }
    
    static func showInvalidMobile(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning"), mActionTitle: NSLocalizedString("submit", comment: "submit"), mMessage: NSLocalizedString("invalid_mobile", comment: ""))
    }
    
    static func showFillDataWithMessage(on vc: UIViewController, message: String){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning"), mActionTitle: NSLocalizedString("submit", comment: "submit"),
                  mMessage: "\(message) \(NSLocalizedString("empty_data_message", comment: ""))" )
    }
    
    static func showInvalidEmail(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning"), mActionTitle: NSLocalizedString("submit", comment: "submit"), mMessage: NSLocalizedString("email_input_matching", comment: ""))
    }
    
    static func showDuplicateEmail(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("warning", comment: "warning"), mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: NSLocalizedString("dupicate_email", comment: "dupicate_email"))
    }
    
    static func showWrongAlertWithMessageAndAction(on vc: UIViewController, message: String){
        oneActionWithDismiss(on: vc, mTitle: NSLocalizedString("warning", comment: "warning") , mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: message)
    }
    
    static func showUpdateMobile(on vc: UIViewController){
        oneAction(on: vc, mTitle: NSLocalizedString("alert", comment: "alert"), mActionTitle: NSLocalizedString("ok", comment: "ok"), mMessage: NSLocalizedString("update_phone", comment: "update_phone"))
    }
    
    static func showNetworkFailed(on vc: UIViewController){
        let alert = UIAlertController(title: NSLocalizedString("Internet", comment: "Internet"), message: NSLocalizedString("internet_failed", comment: "internet_failed"), preferredStyle: .alert)
        let mAction = UIAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .default) { (action) in
            
            vc.dismiss(animated: true, completion: nil)
        }
        alert.addAction(mAction)
        vc.present(alert, animated: true)
    }
    

    
    static func showDissmissVC(on vc: UIViewController){
        
        let alertVC = PMAlertController(title: NSLocalizedString("warning", comment: "warning"), description: NSLocalizedString("wrong_message", comment: "wrong_message"), image: UIImage(named: "logo22.png"), style: .alert)
        
        alertVC.addAction(PMAlertAction(title: NSLocalizedString("ok", comment: "ok"), style: .cancel, action: { () -> Void in
            vc.dismiss(animated: true, completion: nil)
        }))
        
        vc.present(alertVC, animated: true, completion: nil)
    }
    
}
