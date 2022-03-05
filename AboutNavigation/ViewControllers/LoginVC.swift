//
//  LoginVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit
import Resolver

final class LoginVC: UIViewController {
    
    @Injected private var authManager: AuthManager
    private var navigator: LoginNavigator!
    
    private lazy var usernameTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "username"
        view.returnKeyType = .done
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        view.returnKeyType = .done
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("Login", for: .normal)
        view.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.configuration = .filled()
        view.tintColor = UIColor.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.setTitle("Register", for: .normal)
        view.addTarget(self, action: #selector(registerButtonTappedTapped), for: .touchUpInside)
        view.configuration = .filled()
        view.tintColor = UIColor.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var forgotPasswordButton: UIButton = {
        let view = UIButton()
        view.setTitle("Forgot Password?", for: .normal)
        view.addTarget(self, action: #selector(forgotPasswordButtonTapped), for: .touchUpInside)
        view.configuration = .plain()
        view.tintColor = UIColor.orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigator = LoginNavigator(navigationController: navigationController, viewController: self)
        setupUI()
        title = "Login"
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(passwordTextfield)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(registerButton)
        stackView.addArrangedSubview(forgotPasswordButton)
        
        view.backgroundColor = UIColor.white
    }
    
    
    @objc private func loginButtonTapped() {
        let _ = self.authManager.login(
            username: usernameTextfield.text ?? "",
            password: passwordTextfield.text ?? "")
    }
    
    @objc private func registerButtonTappedTapped() {
        navigator.go(to: .signup)
    }
    
    @objc private func forgotPasswordButtonTapped() {
        navigator.go(to: .forgetPassword)
    }
    
}
