//
//  MyLoginFlowWireframe.swift
//  VN-Walker
//
//  Created by Huy on 4/7/24.
//  Copyright © Huy. All rights reserved.
//

import UIKit

class MyLoginFlowWireframe {
    // MARK: - VIPER Stack
    lazy var moduleInteractor = MyLoginFlowInteractor()
    // Uncomment to use a navigationController from storyboard
    /*
     lazy var moduleNavigationController: UINavigationController = {
     let sb = MyLoginFlowWireframe.storyboard()
     let nc = (sb.instantiateViewController(withIdentifier: MyLoginFlowConstants.navigationControllerIdentifier) as? UINavigationController)!
     return nc
     }()
     */
    lazy var modulePresenter = MyLoginFlowPresenter()
    lazy var moduleView: MyLoginFlowView = {
        // Uncomment the commented line below and delete the storyboard
        //      instantiation to use a navigationController from storyboard
        //let vc = self.moduleNavigationController.viewControllers[0] as! MyLoginFlowView
        let sb = MyLoginFlowWireframe.storyboard()
        let vc = (sb.instantiateViewController(withIdentifier: MyLoginFlowConstants.viewIdentifier) as? MyLoginFlowView)!
        _ = vc.view
        return vc
    }()
    
    // MARK: - Computed VIPER Variables
    lazy var presenter: MyLoginFlowWireframeToPresenterInterface = self.modulePresenter
    lazy var view: MyLoginFlowNavigationInterface = self.moduleView
    
    // MARK: - Instance Variables
    
    // MARK: - Initialization
    init() {
        let i = moduleInteractor
        let p = modulePresenter
        let v = moduleView
        
        i.presenter = p
        
        p.interactor = i
        p.view = v
        p.wireframe = self
        
        v.presenter = p
    }
    
    class func storyboard() -> UIStoryboard {
        return UIStoryboard(
            name: MyLoginFlowConstants.storyboardIdentifier,
            bundle: Bundle(for: MyLoginFlowWireframe.self)
        )
    }
    
    // MARK: - Operational
    
}

// MARK: - Module Interface
extension MyLoginFlowWireframe: MyLoginFlow {
    var delegate: MyLoginFlowDelegate? {
        get {
            return presenter.delegate
        }
        set {
            presenter.set(delegate: newValue)
        }
    }
}

// MARK: - Presenter to Wireframe Interface
extension MyLoginFlowWireframe: MyLoginFlowPresenterToWireframeInterface {
    
}

// MARK: - Communication Interfaces
// Interface Abstraction for working with the VIPER Module
protocol MyLoginFlow: AnyObject {
    var delegate: MyLoginFlowDelegate? { get set }
}

// VIPER Module Constants
struct MyLoginFlowConstants {
    // Uncomment to utilize a navigation controller from storyboard
    //static let navigationControllerIdentifier = "MyLoginFlowNavigationController"
    static let storyboardIdentifier = "MyLoginFlow"
    static let viewIdentifier = "MyLoginFlowView"
}

// VIPER Interface for manipulating the navigation of the view
protocol MyLoginFlowNavigationInterface: AnyObject {
    
}

// VIPER Interface for communication from Wireframe -> Presenter
protocol MyLoginFlowWireframeToPresenterInterface: AnyObject {
    var delegate: MyLoginFlowDelegate? { get }
    func set(delegate newDelegate: MyLoginFlowDelegate?)
}
