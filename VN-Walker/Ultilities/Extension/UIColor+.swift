//
//  UIColor+.swift
//  VN-Walker
//
//  Created by Huy on 2/7/24.
//  Copyright © Huy. All rights reserved.
//

import UIKit

public struct HexColor {
    public static let hexFFFFFF = UIColor(rgb: 0xFFFFFF)
}

extension UIColor {
    convenience init(rgb: UInt) {
        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }
}
