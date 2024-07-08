//
//  MyLoginFlowPresenter.swift
//  VN-Walker
//
//  Created by Huy on 4/7/24.
//  Copyright © Huy. All rights reserved.
//

import Foundation

class MyLoginFlowPresenter {
    // MARK: - VIPER Stack
    weak var interactor: MyLoginFlowPresenterToInteractorInterface!
    weak var view: MyLoginFlowPresenterToViewInterface!
    weak var wireframe: MyLoginFlowPresenterToWireframeInterface!
    
    // MARK: - Instance Variables
    weak var delegate: MyLoginFlowDelegate?
    var moduleWireframe: MyLoginFlow {
        get {
            let mw = (self.wireframe as? MyLoginFlow)!
            return mw
        }
    }
    
    // MARK: - Operational
    
}

// MARK: - Interactor to Presenter Interface
extension MyLoginFlowPresenter: MyLoginFlowInteractorToPresenterInterface {
    
}

// MARK: - View to Presenter Interface
extension MyLoginFlowPresenter: MyLoginFlowViewToPresenterInterface {
    
}

// MARK: - Wireframe to Presenter Interface
extension MyLoginFlowPresenter: MyLoginFlowWireframeToPresenterInterface {
    func set(delegate newDelegate: MyLoginFlowDelegate?) {
        delegate = newDelegate
    }
}

// MARK: - Communication Interfaces
// VIPER Interface to the Module
protocol MyLoginFlowDelegate: AnyObject {
    
}

// VIPER Interface for communication from Presenter to Interactor
protocol MyLoginFlowPresenterToInteractorInterface: AnyObject {
    
}

// VIPER Interface for communication from Presenter -> Wireframe
protocol MyLoginFlowPresenterToWireframeInterface: AnyObject {
    
}

// VIPER Interface for communication from Presenter -> View
protocol MyLoginFlowPresenterToViewInterface: AnyObject {
    
}
