//
//  UIView+.swift
//  VN-Walker
//
//  Created by Huy on 4/7/24.
//  Copyright © Huy. All rights reserved.
//

import Foundation
import UIKit
import VisualEffectView

public extension UIView {
    @IBInspectable var borderColor: UIColor? {
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {
            guard let color = newValue else {
                layer.borderColor = nil
                return
            }
            // Fix React-Native conflict issue
            guard String(describing: type(of: color)) != "__NSCFType" else { 
                return }
            layer.borderColor = color.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.masksToBounds = true
            layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
        }
    }
    
    @IBInspectable var blurEffect: Bool {
        get { return false }
        set {
            if newValue {
                let visualEffectView = VisualEffectView()
                visualEffectView.frame = self.bounds
                visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

                // Tùy chỉnh hiệu ứng mờ
                visualEffectView.blurRadius = 3.5
                visualEffectView.colorTint = .black
                visualEffectView.colorTintAlpha = 0.46
                visualEffectView.scale = 1

                // Thêm visualEffectView vào view hiện tại
                self.addSubview(visualEffectView)
            }
        }
    }
}
