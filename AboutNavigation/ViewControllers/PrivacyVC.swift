//
//  PrivacyVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/17/1400 AP.
//

import Foundation
import UIKit

final class PrivacyVC: UIViewController {
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = someText
        view.numberOfLines = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("Visit Our site", for: .normal)
        view.configuration = .filled()
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
        setupUI()
        title = "Item Detail"
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(button)
        
        view.backgroundColor = .systemBackground
    }
    
}


fileprivate let someText = """
In the Project Navigator, right click on the storyboard and choose delete.

Note that deleting the storyboard doesn’t tell our app not to use storyboards. Even worse, our app will look for the storyboard we just deleted and the app will crash. What we have to do is find the place that says we have to use storyboards, and modify it.

Click on the project’s name in the Project Navigator to access the options. In your target’s options, in General > Deployment Info, a field named Main Interface has Main written in it. This looks for the storyboard named Main, but we just deleted it 😱
"""
