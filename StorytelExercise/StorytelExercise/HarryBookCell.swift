//
//  HarryBookCell.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-06-11.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit

class HarryBookCell: UICollectionViewCell {
    
    let bookImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "hpImage")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Book title"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let authorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "by author 1"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let narratorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "with narrator 1"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // Mark: Properties
    
    // Mark
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(bookImageView)
        bookImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, width: frame.height - 20, height: frame.height - 20)
        
        addSubview(bookTitleLabel)
        bookTitleLabel.anchor(top: bookImageView.topAnchor, left: bookImageView.rightAnchor, paddingTop: 8, paddingLeft: 10)
        
        addSubview(authorsLabel)
        authorsLabel.anchor(top: bookTitleLabel.bottomAnchor, left: bookTitleLabel.leftAnchor, paddingTop: 12)
        
        addSubview(narratorsLabel)
               narratorsLabel.anchor(top: authorsLabel.bottomAnchor, left: authorsLabel.leftAnchor, paddingTop: 6)
        
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
