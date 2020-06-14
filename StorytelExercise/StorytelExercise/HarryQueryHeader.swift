//
//  QueryHeader.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-06-10.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit

class HarryQueryHeader: UITableViewHeaderFooterView {
    let headerViewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Query: Harry"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        headerViewLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(headerViewLabel)

        headerViewLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        headerViewLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    
    }
}
