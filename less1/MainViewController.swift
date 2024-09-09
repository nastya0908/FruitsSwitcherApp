//
//  MainViewController.swift
//  less1
//
//  Created by Aleksandr Grachev on 09.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let fruits: [String] = ["Banana",
                                    "Orange",
                                    "Apple",
                                    "Strawberry"]
    
    private var index: Int = 0
    
    // MARK: - Subviews
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var hStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var vStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 49
        return stack
    }()
    
    private lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(
            .init { [weak self] _ in
                self?.didTapLeftButton()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.backgroundColor = .clear
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(
            .init { [weak self] _ in
                self?.didTapRightButton()
            },
            for: .touchUpInside
        )
        return button
    }()
    
    private var fruitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp(with: index)
        configureUI()
    }
    
    @objc
    private func didTapLeftButton() {
        if index <= 0 {
            index = 3
        } else {
            index -= 1
        }
        setUp(with: index)
    }
    
    @objc
    private func didTapRightButton() {
        if index >= 3 {
            index = 0
        } else {
            index += 1
        }
        setUp(with: index)
    }
    
    private func setUp(with index: Int) {
        label.text = fruits[index]
        fruitImageView.image = UIImage(named: fruits[index])
    }
    
    private func configureUI() {
        view.backgroundColor = .background
        
        hStackView.addArrangedSubview(leftButton)
        hStackView.addArrangedSubview(label)
        hStackView.addArrangedSubview(rightButton)
        vStackView.addArrangedSubview(fruitImageView)
        vStackView.addArrangedSubview(hStackView)
        view.addSubview(vStackView)
        
        NSLayoutConstraint.activate([
            vStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            fruitImageView.heightAnchor.constraint(equalToConstant: 230),
            fruitImageView.widthAnchor.constraint(equalToConstant: 338),
            
            hStackView.heightAnchor.constraint(equalToConstant: 24),
            
            leftButton.widthAnchor.constraint(equalToConstant: 24),
            
            label.widthAnchor.constraint(equalToConstant: 290),
            
            rightButton.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
}
