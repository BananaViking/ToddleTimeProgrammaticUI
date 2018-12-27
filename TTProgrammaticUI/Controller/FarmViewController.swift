//
//  FarmViewController.swift
//  TTProgrammaticUI
//
//  Created by Banana Viking on 12/26/18.
//  Copyright © 2018 Banana Viking. All rights reserved.
//

import UIKit

class FarmViewController: UIViewController {
    
    let cardBank = CardBank()
    
    let button0 = UIButton()
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    let button4 = UIButton()
    let button5 = UIButton()
    
    let topStackView = UIStackView()
    let middleStackView = UIStackView()
    let bottomStackView = UIStackView()
    let allStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground),
                                               name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        view.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.6392156863, blue: 0.2549019608, alpha: 1)
        
        button0.tag = 1
        button1.tag = 2
        button2.tag = 3
        button3.tag = 4
        button4.tag = 5
        button5.tag = 6
        
        let buttons = [button0, button1, button2, button3, button4, button5]
        
        for button in buttons {
            button.backgroundColor = #colorLiteral(red: 1, green: 0.8235294118, blue: 0.01176470588, alpha: 1)
            cardBank.setupButtonStyle(button: button)
        }
        
        let horizontalStackViews = [topStackView, middleStackView, bottomStackView]
        
        for stackView in horizontalStackViews {
            setupHorizontalStackView(stackView: stackView)
        }
        
        topStackView.addArrangedSubview(button0)
        topStackView.addArrangedSubview(button1)
        
        middleStackView.addArrangedSubview(button2)
        middleStackView.addArrangedSubview(button3)
        
        bottomStackView.addArrangedSubview(button4)
        bottomStackView.addArrangedSubview(button5)
        
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
        for i in 1...6 {
            if let card = view.viewWithTag(i) as? UIButton {
                card.setImage(nil, for: .normal)
                card.backgroundColor = cardBank.cards[i - 1].color  // convert tag to index
            }
        }
    }
}
