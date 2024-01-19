//
//  ViewController.swift
//  SignWithApplePOC
//
//  Created by Sweda Thiyagarajan on 05/05/2022.
//

import UIKit
import AuthenticationServices

class ViewController: UIViewController {

    @IBOutlet weak var apple: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        apple.layer.cornerRadius = 24
        // Do any additional setup after loading the view.
    }

    @IBAction func signInThrouApple(_ sender: UIButton) {
        let appId = ASAuthorizationAppleIDProvider()
        let request = appId.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorisation = ASAuthorizationController(authorizationRequests: [request])
        authorisation.delegate = self
        authorisation.presentationContextProvider = self
        authorisation.performRequests()
    }
}

extension ViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            let appleId = appleIDCredential.user
            let appleUserFirstName = appleIDCredential.fullName?.givenName
            let appleUserLastName = appleIDCredential.fullName?.familyName
            let appleUserEmail = appleIDCredential.email
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            
            let appleUsername = passwordCredential.user
            let applePassword = passwordCredential.password
        }
    }
}


extension ViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
            return self.view.window!
        }
}

