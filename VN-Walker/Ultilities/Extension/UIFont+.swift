//
//  UIFont+.swift
//  VN-Walker
//
//  Created by Huy on 4/7/24.
//  Copyright © Huy. All rights reserved.
//

import Foundation
import UIKit

enum FontEnum: String {
    case regular = "Satoshi-Regular"
    case mediumItalic = "Satoshi-MediumItalic"
    case medium = "Satoshi-Medium"
    case boldItelic = "Satoshi-BoldItalic"
    case bold = "Satoshi-Bold"
}

extension UIFont {
    /// Create a UIFont object with a `Font` enum
    convenience init?(font: FontEnum, size: CGFloat) {
        let fontIdentifier: String = font.rawValue
        self.init(name: fontIdentifier, size: size)
    }
}
