//
//  HarryBookCell.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-06-11.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit

class HarryBookCell: UITableViewCell {
    
    var bookTitle: String? {
        didSet {
            guard let bookTitle = bookTitle else { return }
            bookTitleLabel.text = bookTitle
        }
    }
    
    var authors: [Author]? {
        didSet {
            guard let authors = authors else { return }
            if authors.count > 0 {
                authorsLabel.text = "by"
            }
            for i in 0..<authors.count {
                authorsLabel.text?.append(" " + authors[i].name)
                if i < authors.count - 1 {
                    authorsLabel.text?.append(",")
                }
            }
        }
    }
    
    var narrators: [Narrator]? {
        didSet {
            guard let narrators = narrators else { return }
            if narrators.count > 0 {
                narratorsLabel.text = "with"
            }
            for i in 0..<narrators.count {
                narratorsLabel.text?.append(" " + narrators[i].name)
                if i < narrators.count - 1 {
                    narratorsLabel.text?.append(",")
                }
            }
        }
    }
    
    var coverImage: UIImage? {
        didSet {
            guard let coverImage = coverImage else { return }
            bookImageView.image = coverImage
        }
    }
    
    let bookImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = nil
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        return iv
    }()
    
    let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let authorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let narratorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bookImageView)
        
        bookImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, width: 100, height: 100)
        
        addSubview(bookTitleLabel)
        bookTitleLabel.anchor(top: bookImageView.topAnchor, left: bookImageView.rightAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 10, paddingRight: 10)
        
        
        addSubview(narratorsLabel)
        narratorsLabel.anchor(left: bookTitleLabel.leftAnchor, bottom: bookImageView.bottomAnchor, right: rightAnchor, paddingBottom: 8, paddingRight: 10)
        
        if narrators?.count ?? 0 > 0 {
            addSubview(authorsLabel)
            authorsLabel.anchor(left: bookTitleLabel.leftAnchor, bottom: narratorsLabel.topAnchor, right: rightAnchor, paddingBottom: 8, paddingRight: 10)
        }
        addSubview(authorsLabel)
        authorsLabel.anchor(left: bookTitleLabel.leftAnchor, bottom: narratorsLabel.topAnchor, right: rightAnchor, paddingBottom: 8, paddingRight: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
