//
//  AddVC.swift
//  SimpleFinanceTracker
//
//  Created by Lane Faison on 7/22/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class AddVC: UIViewController {

    let addView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.lightPrimaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type:"
        label.textColor = ColorScheme.primaryText
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.dividerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let revenueButton: RoundedOutlineButton = {
        let button = RoundedOutlineButton(type: .system)
        button.backgroundColor = ColorScheme.textOrIcons
        button.borderColor = ColorScheme.darkPrimaryColor
        button.borderWidth = 3
        button.cornerRadius = 45
        button.titleLabel?.font = UIFont(name: "Avenir next", size: 16)
        button.addTarget(self, action: #selector(revenueButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let expenseButton: RoundedOutlineButton = {
        let button = RoundedOutlineButton(type: .system)
        button.backgroundColor = ColorScheme.textOrIcons
        button.borderColor = .red
        button.borderWidth = 3
        button.cornerRadius = 45
        button.titleLabel?.font = UIFont(name: "Avenir next", size: 16)
        button.addTarget(self, action: #selector(expenseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var isRevenueButtonTapped = false
        var isExpenseButtonTapped = false

        view.addSubview(addView)
        
        setupAddView()
    
    }

    func setupAddView() {
        addView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        addView.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        addView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        addView.addSubview(typeLabel)
        typeLabel.topAnchor.constraint(equalTo: addView.topAnchor, constant: 0).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: addView.leftAnchor, constant: 0).isActive = true
        
        addView.addSubview(dividerView)
        dividerView.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        dividerView.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5).isActive = true
        dividerView.widthAnchor.constraint(equalTo: addView.widthAnchor, constant: 0).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true

        addView.addSubview(revenueButton)
        revenueButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor, constant: -60).isActive = true
        revenueButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20).isActive = true
        revenueButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        revenueButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        revenueButton.setTitle("Revenue", for: .normal)
        
        addView.addSubview(expenseButton)
        expenseButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor, constant: 60).isActive = true
        expenseButton.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 20).isActive = true
        expenseButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        expenseButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        expenseButton.setTitle("Expense", for: .normal)
        
        
    }
    
    func revenueButtonTapped() {
        print(123)
        
    }
    
    func expenseButtonTapped() {
        print(456)
    }
    


}
