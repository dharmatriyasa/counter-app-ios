//
//  ViewController.swift
//  CounterApp
//
//  Created by Dewa Nyoman Dharma Triyasa on 21/03/24.
//

import UIKit

class ViewController: UIViewController {
    
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        
        setUpView()
    }
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var counterLabel: UILabel = {
        let ui = UILabel()
        ui.translatesAutoresizingMaskIntoConstraints = false
        ui.text = "\(counter)"
        ui.font = UIFont.boldSystemFont(ofSize: 100)
        ui.textColor = .white
        return ui
    }()
    
    private lazy var increaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(incrementCounter), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var decreaseButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(decrementCounter), for: .touchUpInside)
        
        return button
    }()
    
    private func setUpView() {
        mainView.addSubview(counterLabel)
        mainView.addSubview(increaseButton)
        mainView.addSubview(decreaseButton)
        
        setUpLayoutConstraints()
    }
    
    private func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            counterLabel.centerYAnchor.constraint(equalTo: mainView.centerYAnchor, constant: -36),
            counterLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            
            decreaseButton.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -144),
            decreaseButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 24),
            
            increaseButton.bottomAnchor.constraint(equalTo: decreaseButton.bottomAnchor),
            increaseButton.leadingAnchor.constraint(equalTo: decreaseButton.trailingAnchor, constant: 48),
            increaseButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -24),
            increaseButton.widthAnchor.constraint(equalTo: decreaseButton.widthAnchor)
        ])
    }
    
    @objc private func incrementCounter() {
        self.counter += 1
        self.counterLabel.text = "\(self.counter)"
    }
    
    @objc private func decrementCounter() {
        self.counter -= 1
        self.counterLabel.text = "\(self.counter)"
    }
}

