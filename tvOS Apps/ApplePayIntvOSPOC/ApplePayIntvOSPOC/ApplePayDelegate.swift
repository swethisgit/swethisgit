//
//  ApplePayDelegate.swift
//  ApplePayIntvOSPOC
//
//  Created by Sweda Thiyagarajan on 07/05/2022.
//

import TVMLKit

class ApplePayDelegate {
    public func payController(_ delegate: AppDelegate){
        if let payController = UIStoryboard(name: "PayStoryboard", bundle: nil).instantiateViewController(withIdentifier: "ApplePayViewController") as? ApplePayViewController {
            if let navigator =  delegate.appController?.navigationController {
                navigator.pushViewController(payController, animated: true)
            }
        }
    }
}
