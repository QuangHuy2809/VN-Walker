//
//  MyLoginFlowInteractor.swift
//  VN-Walker
//
//  Created by Huy on 4/7/24.
//  Copyright © Huy. All rights reserved.
//

import Foundation

class MyLoginFlowInteractor {
    // MARK: - VIPER Stack
    weak var presenter: MyLoginFlowInteractorToPresenterInterface!
    
    // MARK: - Instance Variables
    
    // MARK: - Operational
    
}

// MARK: - Presenter To Interactor Interface
extension MyLoginFlowInteractor: MyLoginFlowPresenterToInteractorInterface {
    
}

// MARK: - Communication Interfaces
// VIPER Interface for communication from Interactor -> Presenter
protocol MyLoginFlowInteractorToPresenterInterface: AnyObject {
    
}
