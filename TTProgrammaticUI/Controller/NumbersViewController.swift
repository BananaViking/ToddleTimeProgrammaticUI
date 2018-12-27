//
//  NumbersViewController.swift
//  TTProgrammaticUI
//
//  Created by Banana Viking on 12/26/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController {
    
    let cardBank = CardBank()
    
    let button12 = UIButton()
    let button13 = UIButton()
    let button14 = UIButton()
    let button15 = UIButton()
    let button16 = UIButton()
    let button17 = UIButton()
    
    let topStackView = UIStackView()
    let middleStackView = UIStackView()
    let bottomStackView = UIStackView()
    let allStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.8235294118, blue: 0.01176470588, alpha: 1)
        
        let buttons = [button12, button13, button14, button15, button16, button17]
        
        for i in 0...5 {
            buttons[i].tag = i + 13  // tag is 13 more than Numbers button index
            buttons[i].backgroundColor = #colorLiteral(red: 0.003921568627, green: 0.462745098, blue: 0.7647058824, alpha: 1)
            cardBank.setupButtonStyle(button: buttons[i])
        }
        
        let horizontalStackViews = [topStackView, middleStackView, bottomStackView]
        
        for stackView in horizontalStackViews {
            setupHorizontalStackView(stackView: stackView)
        }
        
        topStackView.addArrangedSubview(button12)
        topStackView.addArrangedSubview(button13)
        
        middleStackView.addArrangedSubview(button14)
        middleStackView.addArrangedSubview(button15)
        
        bottomStackView.addArrangedSubview(button16)
        bottomStackView.addArrangedSubview(button17)
        
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
    
    override func viewWillDisappear(_ animated: Bool) {
        cardBank.playSound(forObject: "pageTurnSound")
        resetCards()
    }
    
    @objc func appDidEnterBackground() {
        resetCards()
    }
    
    func resetCards() {
        for i in 13...18 {
            if let card = view.viewWithTag(i) as? UIButton {
                card.setImage(nil, for: .normal)
                card.backgroundColor = cardBank.cards[i - 1].color  // tag is 1 more than card index
            }
        }
    }
}
