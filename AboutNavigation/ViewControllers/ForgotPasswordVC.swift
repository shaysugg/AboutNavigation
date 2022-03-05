//
//  ForgotPasswordVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit

final class ForgotPasswordVC: UIViewController {
    
    private var navigator: ForgotPasswordNavigator!
    
    private lazy var usernameTextfield: UITextField = {
        let view = UITextField()
        view.placeholder = "Email"
        view.returnKeyType = .done
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("Send Verification Code", for: .normal)
        view.configuration = .filled()
        view.addTarget(self, action: #selector(buttonDidTapped), for: .touchUpInside)
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
        self.navigator = ForgotPasswordNavigator(navigationController: navigationController, viewController: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Forgot Password VC"
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(button)
        
        view.backgroundColor = UIColor.white
    }
    
    @objc private func buttonDidTapped() {
        print("chaingign the password ...")
        navigator.go(to: .passwordChanged)
    }
    
}
