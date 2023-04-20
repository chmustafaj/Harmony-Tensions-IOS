//
//  UIView+Extension.swift
//  HarmonyTensions
//
//  Created by Chaudhry Mustafa Jawad on 20/04/2023.
//

import Foundation
import UIKit
extension UIView{
    @IBInspectable var cornerRadius: CGFloat{
        get {return cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
