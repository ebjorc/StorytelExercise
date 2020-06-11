//
//  QueryHeader.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-06-10.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit

class HarryQueryHeader: UICollectionReusableView{

    let headerViewLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Query: Harry"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        addSubview(headerViewLabel)
        headerViewLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        headerViewLabel.anchor(top: topAnchor, paddingTop: 80)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
