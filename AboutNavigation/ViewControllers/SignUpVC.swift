//
//  SignUpVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit
import Resolver

final class SignUpVC: UIViewController {
    
    private var navigator: SignUpNavigator!
    
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
    
    private lazy var nameTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "name"
        view.returnKeyType = .done
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("Sign Up", for: .normal)
        view.configuration = .filled()
        view.tintColor = UIColor.orange
        view.addTarget(self, action: #selector(register), for: .touchUpInside)
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
        self.navigator = SignUpNavigator(navigationController: navigationController, viewController: self)
        
    }
    
//    convenience init(navigator: SignUpNavigator) {
//
//        super.init(nibName: nil, bundle: nil)
//        self.navigator = navigator
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Signup"
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(passwordTextfield)
        stackView.addArrangedSubview(nameTextfield)
        stackView.addArrangedSubview(button)
        
        view.backgroundColor = UIColor.white
    }
    
    @objc private func register() {
        let manager: AuthManager = Resolver.resolve()
        manager.register(username: nameTextfield.text ?? "", password: passwordTextfield.text ?? "")
    }
    
}
