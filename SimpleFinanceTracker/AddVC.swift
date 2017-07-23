//
//  AddVC.swift
//  SimpleFinanceTracker
//
//  Created by Lane Faison on 7/22/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class AddVC: UIViewController, UITextFieldDelegate {
    
    var isRevenueButtonTapped = false
    var isExpenseButtonTapped = false

    let addView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.textOrIcons
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.textColor = ColorScheme.primaryText
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerView1: UIView = {
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
        button.tintColor = ColorScheme.primaryText
        button.addTarget(self, action: #selector(revenueButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let expenseButton: RoundedOutlineButton = {
        let button = RoundedOutlineButton(type: .system)
        button.backgroundColor = ColorScheme.textOrIcons
        button.borderColor = ColorScheme.darkPrimaryColor
        button.borderWidth = 3
        button.cornerRadius = 45
        button.titleLabel?.font = UIFont(name: "Avenir next", size: 16)
        button.tintColor = ColorScheme.primaryText
        button.addTarget(self, action: #selector(expenseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = ColorScheme.primaryText
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerView2: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.dividerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "ex. Apartment Rent"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = ColorScheme.primaryText.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Amount"
        label.textColor = ColorScheme.primaryText
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerView3: UIView = {
        let view = UIView()
        view.backgroundColor = ColorScheme.dividerColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.keyboardType = .decimalPad
        textField.placeholder = "$0.00"
        textField.textAlignment = .center
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 5
        textField.layer.borderColor = ColorScheme.primaryText.cgColor
        textField.layer.borderWidth = 2
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let addButton: RoundedOutlineButton = {
        let button = RoundedOutlineButton()
        button.backgroundColor = ColorScheme.primaryColor
        button.borderColor = ColorScheme.darkPrimaryColor
        button.borderWidth = 3
        button.cornerRadius = 25
        button.titleLabel?.font = UIFont(name: "Avenir next", size: 16)
        button.tintColor = ColorScheme.textOrIcons
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isRevenueButtonTapped = false
        isExpenseButtonTapped = false

        view.addSubview(addView)
        
        setupAddView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    
    }

    func setupAddView() {
        addView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        addView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20).isActive = true
        addView.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        addView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        
        addView.addSubview(typeLabel)
        typeLabel.topAnchor.constraint(equalTo: addView.topAnchor, constant: 0).isActive = true
        typeLabel.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        
        addView.addSubview(dividerView1)
        dividerView1.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        dividerView1.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 5).isActive = true
        dividerView1.widthAnchor.constraint(equalTo: addView.widthAnchor, constant: 0).isActive = true
        dividerView1.heightAnchor.constraint(equalToConstant: 2).isActive = true

        addView.addSubview(revenueButton)
        revenueButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor, constant: -60).isActive = true
        revenueButton.topAnchor.constraint(equalTo: dividerView1.bottomAnchor, constant: 20).isActive = true
        revenueButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        revenueButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        revenueButton.setTitle("Revenue", for: .normal)
        
        addView.addSubview(expenseButton)
        expenseButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor, constant: 60).isActive = true
        expenseButton.topAnchor.constraint(equalTo: dividerView1.bottomAnchor, constant: 20).isActive = true
        expenseButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
        expenseButton.heightAnchor.constraint(equalToConstant: 90).isActive = true
        expenseButton.setTitle("Expense", for: .normal)
        
        addView.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: revenueButton.bottomAnchor, constant: 30).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        
        addView.addSubview(dividerView2)
        dividerView2.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        dividerView2.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        dividerView2.widthAnchor.constraint(equalTo: addView.widthAnchor, constant: 0).isActive = true
        dividerView2.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        addView.addSubview(descriptionTextField)
        descriptionTextField.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        descriptionTextField.topAnchor.constraint(equalTo: dividerView2.bottomAnchor, constant: 20).isActive = true
        descriptionTextField.widthAnchor.constraint(equalTo: addView.widthAnchor, constant: -100).isActive = true
        descriptionTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addView.addSubview(amountLabel)
        amountLabel.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 30).isActive = true
        amountLabel.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        
        addView.addSubview(dividerView3)
        dividerView3.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        dividerView3.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 5).isActive = true
        dividerView3.widthAnchor.constraint(equalTo: addView.widthAnchor, constant: 0).isActive = true
        dividerView3.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        addView.addSubview(amountTextField)
        amountTextField.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        amountTextField.topAnchor.constraint(equalTo: dividerView3.bottomAnchor, constant: 20).isActive = true
        amountTextField.widthAnchor.constraint(equalTo: addView.widthAnchor, constant: -100).isActive = true
        amountTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        addView.addSubview(addButton)
        addButton.centerXAnchor.constraint(equalTo: addView.centerXAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.setTitle("Add", for: .normal)
    }
    
    func revenueButtonTapped() {
        print(123)
        if isRevenueButtonTapped == false {
            isRevenueButtonTapped = true
            isExpenseButtonTapped = false
            checkButtons()
        } else {
            isRevenueButtonTapped = false
            isExpenseButtonTapped = true
            checkButtons()
        }
    }
    
    func expenseButtonTapped() {
        print(456)
        if isExpenseButtonTapped == false {
            isExpenseButtonTapped = true
            isRevenueButtonTapped = false
            checkButtons()
        } else {
            isExpenseButtonTapped = false
            isRevenueButtonTapped = true
            checkButtons()
        }
    }
    
    func checkButtons() {
        if isRevenueButtonTapped == true {
            revenueButton.tintColor = ColorScheme.textOrIcons
            revenueButton.backgroundColor = ColorScheme.primaryColor
            expenseButton.tintColor = ColorScheme.primaryText
            expenseButton.backgroundColor = ColorScheme.textOrIcons
        }
        if isRevenueButtonTapped == false {
            revenueButton.tintColor = ColorScheme.primaryText
            revenueButton.backgroundColor = ColorScheme.textOrIcons
            expenseButton.tintColor = ColorScheme.textOrIcons
            expenseButton.backgroundColor = ColorScheme.primaryColor
        }
        if isExpenseButtonTapped == true {
            expenseButton.tintColor = ColorScheme.textOrIcons
            expenseButton.backgroundColor = ColorScheme.primaryColor
            revenueButton.tintColor = ColorScheme.primaryText
            revenueButton.backgroundColor = ColorScheme.textOrIcons
        }
        if isExpenseButtonTapped == false {
            expenseButton.tintColor = ColorScheme.primaryText
            expenseButton.backgroundColor = ColorScheme.textOrIcons
            revenueButton.tintColor = ColorScheme.textOrIcons
            revenueButton.backgroundColor = ColorScheme.primaryColor
        }
    }
    
    func addButtonTapped() {
        print("$\(amountTextField.text)")
    }
    
    // Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide keyboard when user presses Return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Scrolls view up when keyboard shows
    func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 150
        }
    }
    
    // Scrolls view down when keyboard hides
    func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y += 150
        }
    }
}
