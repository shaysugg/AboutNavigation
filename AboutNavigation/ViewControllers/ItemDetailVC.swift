//
//  ItemDetailVC.swift
//  AboutNavigation
//
//  Created by Sha Yan on 10/11/1400 AP.
//

import Foundation
import UIKit

final class ItemDetailVC: UIViewController {
    
    let id: Int
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Detail About:"
        view.font = UIFont.preferredFont(forTextStyle: .title1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emojiLabel: UILabel = {
        let view = UILabel()
        view.text = ""
        view.font = UIFont.preferredFont(forTextStyle: .title1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.setTitle("See more", for: .normal)
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
    
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        title = "Item Detail"
        setEmojiLabel()
    }
    
    private func setupUI() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(emojiLabel)
        stackView.addArrangedSubview(button)
        
        view.backgroundColor = UIColor.white
    }
    
    private func setEmojiLabel() {
        emojiLabel.text =  ItemProvider.items.first { $0.id == id }?.emoji
    }
    
}
