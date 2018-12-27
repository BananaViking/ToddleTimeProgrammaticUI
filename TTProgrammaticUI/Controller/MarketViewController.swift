//
//  MarketViewController.swift
//  TTProgrammaticUI
//
//  Created by Banana Viking on 12/26/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController {
    
    let cardBank = CardBank()
    
    let button6 = UIButton()
    let button7 = UIButton()
    let button8 = UIButton()
    let button9 = UIButton()
    let button10 = UIButton()
    let button11 = UIButton()
    
    let topStackView = UIStackView()
    let middleStackView = UIStackView()
    let bottomStackView = UIStackView()
    let allStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.462745098, blue: 0.7647058824, alpha: 1)
        
        button6.tag = 7
        button7.tag = 8
        button8.tag = 9
        button9.tag = 10
        button10.tag = 11
        button11.tag = 12
        
        let buttons = [button6, button7, button8, button9, button10, button11]
        
        for button in buttons {
            button.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.1098039216, blue: 0.1411764706, alpha: 1)
            cardBank.setupButtonStyle(button: button)
        }
        
        let horizontalStackViews = [topStackView, middleStackView, bottomStackView]
        
        for stackView in horizontalStackViews {
            setupHorizontalStackView(stackView: stackView)
        }
        
        topStackView.addArrangedSubview(button6)
        topStackView.addArrangedSubview(button7)
        
        middleStackView.addArrangedSubview(button8)
        middleStackView.addArrangedSubview(button9)
        
        bottomStackView.addArrangedSubview(button10)
        bottomStackView.addArrangedSubview(button11)
        
        // allStackView
        allStackView.axis = .vertical
        allStackView.distribution = .fillEqually
        allStackView.spacing = 30
        allStackView.addArrangedSubview(topStackView)
        allStackView.addArrangedSubview(middleStackView)
        allStackView.addArrangedSubview(bottomStackView)
        allStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(allStackView)
        
        // allStackView Constraints
        allStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        allStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        allStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        allStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        allStackView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        allStackView.bottomAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -79).isActive = true
    }
    
    func setupHorizontalStackView(stackView: UIStackView) {
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        allStackView.addArrangedSubview(stackView)
    }
}
