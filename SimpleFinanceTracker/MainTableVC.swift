//
//  MainTableVC.swift
//  SimpleFinanceTracker
//
//  Created by Lane Faison on 7/21/17.
//  Copyright © 2017 Lane Faison. All rights reserved.
//

import UIKit

class MainTableVC: UIViewController {

    let expenseTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let balanceView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let revenueLabel: UILabel = {
        let label = UILabel()
        label.text = "Revenue"
        label.textColor = .black
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let costLabel: UILabel = {
        let label = UILabel()
        label.text = "Cost"
        label.textColor = .black
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let revenueAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = .black
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let costAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "($0.00)"
        label.textColor = .red
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "$0.00"
        label.textColor = .green
        label.font = UIFont(name: "Avenir next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        view.addSubview(expenseTableView)
        view.addSubview(balanceView)
    
        setupExpenseTableView()
        setupBalanceView()
    }
    
    func setupExpenseTableView() {
        expenseTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        expenseTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        expenseTableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        expenseTableView.bottomAnchor.constraint(equalTo: balanceView.topAnchor, constant: 0).isActive = true
    }
    
    func setupBalanceView() {
        balanceView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        balanceView.topAnchor.constraint(equalTo: expenseTableView.bottomAnchor).isActive = true
        balanceView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        balanceView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        balanceView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        balanceView.addSubview(revenueLabel)
        revenueLabel.topAnchor.constraint(equalTo: balanceView.topAnchor, constant: 20).isActive = true
        revenueLabel.leftAnchor.constraint(equalTo: balanceView.leftAnchor, constant: 20).isActive = true
        
        balanceView.addSubview(costLabel)
        costLabel.topAnchor.constraint(equalTo: revenueLabel.bottomAnchor, constant: 15).isActive = true
        costLabel.leftAnchor.constraint(equalTo: balanceView.leftAnchor, constant: 20).isActive = true
        
        balanceView.addSubview(dividerView)
        dividerView.centerXAnchor.constraint(equalTo: balanceView.centerXAnchor).isActive = true
        dividerView.widthAnchor.constraint(equalTo: balanceView.widthAnchor, constant: -40).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        dividerView.topAnchor.constraint(equalTo: costLabel.bottomAnchor, constant: 10).isActive = true
        
        balanceView.addSubview(revenueAmountLabel)
        revenueAmountLabel.topAnchor.constraint(equalTo: balanceView.topAnchor, constant: 20).isActive = true
        revenueAmountLabel.rightAnchor.constraint(equalTo: balanceView.rightAnchor, constant: -20).isActive = true
        
        balanceView.addSubview(costAmountLabel)
        costAmountLabel.topAnchor.constraint(equalTo: revenueAmountLabel.bottomAnchor, constant: 15).isActive = true
        costAmountLabel.rightAnchor.constraint(equalTo: balanceView.rightAnchor, constant: -20).isActive = true
        
        balanceView.addSubview(balanceAmountLabel)
        balanceAmountLabel.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10).isActive = true
        balanceAmountLabel.rightAnchor.constraint(equalTo: balanceView.rightAnchor, constant: -20).isActive = true
    }



}

