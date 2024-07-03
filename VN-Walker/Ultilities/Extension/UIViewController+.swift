//
//  UIViewController+.swift
//  VN-Walker
//
//  Created by Quang Huy on 2/7/24.
//

import UIKit

extension UIViewController {
    class func initFromStoryboard<T: UIViewController>(feature: FeatureApp, identify: String? = nil, bundle: Bundle? = nil) -> T {
        let viewControllerIdentify = identify ?? String(describing: T.self)
        return UIStoryboard.init(name: feature.storyBoardName, bundle: bundle)
            .instantiateViewController(withIdentifier: viewControllerIdentify) as! T
    }
}

public enum FeatureApp {
    case main
    case splash
    case login
    case twalker

    var storyBoardName: String {
        switch self {
        case .main:
            return "Main"
        case .splash:
            return "Splash"
        case .login:
            return "Main"
        case .twalker:
            return "TWalker"
        }
    }
}
