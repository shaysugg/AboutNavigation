//
//  SplashVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 11/17/1400 AP.
//

import Foundation
import UIKit

class SplashVC: UIViewController {
    
    private lazy var progress: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.tintColor = .orange
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDesign()
        progress.startAnimating()
    }
    
    func setupDesign() {
        view.addSubview(progress)
        NSLayoutConstraint.activate([
            progress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progress.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
