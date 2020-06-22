//
//  HarryQueryFooter.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-06-22.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit

class HarryQueryFooter: UITableViewHeaderFooterView {
    
    let spinnerView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents(){
        contentView.addSubview(spinnerView)
        spinnerView.translatesAutoresizingMaskIntoConstraints = false
        spinnerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        spinnerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        spinnerView.startAnimating()
    }
}
