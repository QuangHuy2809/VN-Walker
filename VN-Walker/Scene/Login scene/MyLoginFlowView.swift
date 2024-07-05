//
//  MyLoginFlowView.swift
//  VN-Walker
//
//  Created by Huy on 4/7/24.
//  Copyright © Huy. All rights reserved.
//

import UIKit

class MyLoginFlowView: UIViewController {
    // MARK: - VIPER Stack
    weak var presenter: MyLoginFlowViewToPresenterInterface!
    
    // MARK: - Instance Variables
    private enum LoginStep {
        case started
        case login
        case register
        
        func getHiddenStateConstraint() -> CGFloat {
            switch self {
            case .started:
                return -260
            case .login:
                return -430
            case .register:
                return 0
            }
        }
    }
    
    private enum TypeTextField {
        case username
        case password
        case confirmPassword
        case email
    }
    
    private let originalBottomSpacing: CGFloat = 34
    private var isMainViewStepHidden = true
    private var loginStep: LoginStep = .started {
        didSet {
            setupMainViewState()
        }
    }
    private var isSelectedUsernameTextField: Bool = false {
        didSet {
            userNameTitleFieldLabel.textColor = isSelectedUsernameTextField ? HexColor.enableTextFFFFFF : HexColor.disableTextFFFFFF05
//            setupAttributedPlaceholder(tft: usernameTextField, placeholder: "Enter your username", isSelected: isSelectedUsernameTextField)
            usernameSeperatorView.backgroundColor = isSelectedUsernameTextField ? HexColor.enableTextFFFFFF : HexColor.disableTextFFFFFF05
        }
    }
    private var isSelectedPasswordTextField: Bool = false {
        didSet {
            passwordTitleFieldLabel.textColor = isSelectedPasswordTextField ? HexColor.enableTextFFFFFF : HexColor.disableTextFFFFFF05
//            setupAttributedPlaceholder(tft: passwordTextField, placeholder: "Enter your password", isSelected: isSelectedPasswordTextField)
            passwordSeperatorView.backgroundColor = isSelectedPasswordTextField ? HexColor.enableTextFFFFFF : HexColor.disableTextFFFFFF05
        }
    }

    // MARK: - Outlets

    // MARK: - Outlets for starting view
    @IBOutlet private weak var welcomeTitleLabel: UILabel!
    @IBOutlet private weak var stepAwayTitleLabel: UILabel!
    @IBOutlet private weak var haveAnAccountTitleLabel: UILabel!
    @IBOutlet private weak var signUpStartedViewLabel: UILabel!
    @IBOutlet private weak var startedViewBottomConstraint: NSLayoutConstraint!

    // MARK: - Outlets for login view
    @IBOutlet private weak var userNameTitleFieldLabel: UILabel!
    @IBOutlet private weak var passwordTitleFieldLabel: UILabel!
    @IBOutlet private weak var loginLabel: UILabel!
    @IBOutlet private weak var orLabel: UILabel!
    @IBOutlet private weak var signupLoginViewLabel: UILabel!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var iconHiddenPassImageView: UIImageView!
    @IBOutlet private weak var loginAppleImageVIew: UIImageView!
    @IBOutlet private weak var loginFacebookImageView: UIImageView!
    @IBOutlet private weak var loginGmailImageView: UIImageView!
    @IBOutlet private weak var usernameSeperatorView: UIView!
    @IBOutlet private weak var passwordSeperatorView: UIView!
    @IBOutlet private weak var loginButtonContainerView: UIView!
    @IBOutlet private weak var forgotPasswordLabel: UILabel!
    @IBOutlet private weak var loginViewBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Operational
    @IBAction func invokeStartedButton(_ sender: Any) {
        setupMainViewState()
    }
    
}

// MARK: Class functional
extension MyLoginFlowView {
    private func setupUI() {
        setupAttributedText(lbl: signUpStartedViewLabel)
        setupAttributedText(lbl: signupLoginViewLabel)
        setupAttributedPlaceholder(tft: usernameTextField, placeholder: "Enter your username", isSelected: false)
        setupAttributedPlaceholder(tft: passwordTextField, placeholder: "Enter your password", isSelected: false)
        
        setupMainViewState()
        
        usernameTextField.addTarget(self, action: #selector(touchDownUsernameTextField), for: .touchDown)
        passwordTextField.addTarget(self, action: #selector(touchDownPasswordTextField), for: .touchDown)
    }
    
    private func setupAttributedText(lbl: UILabel) {
        let text1 = NSAttributedString(string: "Don't have an account?",
                                       attributes: [NSAttributedString.Key.font: UIFont(font: .regular, size: 12)!,
                                                    NSAttributedString.Key.foregroundColor: HexColor.disableTextFFFFFF05])
        let text2 = NSAttributedString(string: " Register",
                                       attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                    NSAttributedString.Key.font: UIFont(font: .bold, size: 12)!,
                                                    NSAttributedString.Key.foregroundColor: HexColor.hexFFFFFF])
        let mutable = NSMutableAttributedString()
        mutable.append(text1)
        mutable.append(text2)
        lbl.attributedText = mutable
    }
    
    private func setupAttributedPlaceholder(tft: UITextField, placeholder: String, isSelected: Bool) {
        tft.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: HexColor.disableTextFFFFFF05,
                         NSAttributedString.Key.font: UIFont(font: .regular, size: 15)!]
        )
    }
    
    private func setupMainViewState() {
        switch self.loginStep {
        case .login:
            if self.isMainViewStepHidden {
                isMainViewStepHidden = false
                UIView.animate(withDuration: 0.7) {
                    self.loginViewBottomConstraint.constant = self.originalBottomSpacing
                    self.view.layoutIfNeeded()
                }
            } else {
                isMainViewStepHidden = true
                UIView.animate(withDuration: 0.7) {
                    self.loginViewBottomConstraint.constant = self.loginStep.getHiddenStateConstraint()
                    self.view.layoutIfNeeded()
                }
            }
        case .started:
            if self.isMainViewStepHidden {
                isMainViewStepHidden = false
                UIView.animate(withDuration: 0.7) {
                    self.startedViewBottomConstraint.constant = self.originalBottomSpacing
                    self.view.layoutIfNeeded()
                }
            } else {
                isMainViewStepHidden = true
                UIView.animate(withDuration: 0.7) {
                    self.startedViewBottomConstraint.constant = self.loginStep.getHiddenStateConstraint()
                    self.view.layoutIfNeeded()
                } completion: { _ in
                    self.loginStep = .login
                }

            }
        case .register:
            break
        }
    }
    
//    private func setupStateForTextField(type: TypeTextField) {
//        switch loginStep {
//        case .login:
//            switch type {
//            case .username:
//                
//            case .password:
//            default:
//                break
//            }
//        case .register:
//            break
//        case .started:
//            break
//        }
//    }
    
    @objc 
    private func touchDownUsernameTextField(textField: UITextField) {
        isSelectedUsernameTextField = true
        isSelectedPasswordTextField = false
    }
    
    @objc
    private func touchDownPasswordTextField(textField: UITextField) {
        isSelectedPasswordTextField = true
        isSelectedUsernameTextField = false
    }
}

// MARK: - Navigation Interface
extension MyLoginFlowView: MyLoginFlowNavigationInterface { }

// MARK: - Presenter to View Interface
extension MyLoginFlowView: MyLoginFlowPresenterToViewInterface {
    
}

// MARK: - Communication Interfaces
// VIPER Interface for communication from View -> Presenter
protocol MyLoginFlowViewToPresenterInterface: AnyObject {
    
}
