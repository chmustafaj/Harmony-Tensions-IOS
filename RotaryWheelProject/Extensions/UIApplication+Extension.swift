//
//  UIApplication+Extension.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 27/06/2024.
//

import UIKit


extension UIApplication {
    class func navigationTopViewController() -> UIViewController? {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        
        var topController = keyWindow?.rootViewController
        
        while let presentedViewController = topController?.presentedViewController {
            topController = presentedViewController
        }
        
        if let navController = topController as? UINavigationController {
            return navController.topViewController
        }
        
        return topController
    }
}

