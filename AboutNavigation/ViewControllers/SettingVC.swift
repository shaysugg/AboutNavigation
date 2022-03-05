//
//  SettingVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit
import Resolver

final class SettingVC: UIViewController {
    
    var navigator: SettingNavigator!
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Setting stuff"
        view.font = UIFont.preferredFont(forTextStyle: .title1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var aboutButton: UIButton = {
        let view = UIButton()
        view.setTitle("About Us", for: .normal)
        view.configuration = .borderedTinted()
        view.tintColor = UIColor.orange
        view.addTarget(self, action: #selector(aboutUSButtonTapped), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoutButton: UIButton = {
        let view = UIButton()
        view.setTitle("Logout", for: .normal)
        view.configuration = .filled()
        view.tintColor = UIColor.orange
        view.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
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
        navigator = SettingNavigator(viewController: self)
        setupUI()
        title = "Item Detail"
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(aboutButton)
        stackView.addArrangedSubview(logoutButton)
        
        view.backgroundColor = UIColor.white
    }
 
    
    @objc private func logoutButtonTapped() {
        let authManager: AuthManager = Resolver.resolve()
        authManager.logout()
    }
    
    @objc private func aboutUSButtonTapped() {
        navigator.go(to: .aboutUs)
    }
}

