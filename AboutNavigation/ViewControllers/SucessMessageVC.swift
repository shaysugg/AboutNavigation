//
//  SucessMessageVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/18/1400 AP.
//

import Foundation
import UIKit

final class MessageVC: UIViewController {
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.font = UIFont.preferredFont(forTextStyle: .title2)
        view.numberOfLines = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
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
    
    
    
    private init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    convenience init(message: String, image: UIImage?, imageColor: UIColor = .systemBlue, textColor: UIColor = .label) {
        self.init()
        imageView.image = image
        imageView.tintColor = .systemBlue
        label.text = message
        label.textColor = textColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Item Detail"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
        
        view.backgroundColor = .systemBackground
    }
    
}
