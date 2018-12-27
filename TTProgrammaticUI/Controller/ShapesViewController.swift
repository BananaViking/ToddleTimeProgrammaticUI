//
//  ShapesViewController.swift
//  TTProgrammaticUI
//
//  Created by Banana Viking on 12/26/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class ShapesViewController: UIViewController {
    
    let cardBank = CardBank()
    
    let button18 = UIButton()
    let button19 = UIButton()
    let button20 = UIButton()
    let button21 = UIButton()
    let button22 = UIButton()
    let button23 = UIButton()
    
    let topStackView = UIStackView()
    let middleStackView = UIStackView()
    let bottomStackView = UIStackView()
    let allStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.1098039216, blue: 0.1411764706, alpha: 1)
        
        button18.tag = 19
        button19.tag = 20
        button20.tag = 21
        button21.tag = 22
        button22.tag = 23
        button23.tag = 24
        
        let buttons = [button18, button19, button20, button21, button22, button23]
        
        for button in buttons {
            button.backgroundColor = #colorLiteral(red: 0.4745098039, green: 0.1764705882, blue: 0.5725490196, alpha: 1)
            cardBank.setupButtonStyle(button: button)
        }
        
        let horizontalStackViews = [topStackView, middleStackView, bottomStackView]
        
        for stackView in horizontalStackViews {
            setupHorizontalStackView(stackView: stackView)
        }
        
        topStackView.addArrangedSubview(button18)
        topStackView.addArrangedSubview(button19)
        
        middleStackView.addArrangedSubview(button20)
        middleStackView.addArrangedSubview(button21)
        
        bottomStackView.addArrangedSubview(button22)
        bottomStackView.addArrangedSubview(button23)
        
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
