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
            for author in authors {
                authorsLabel.text?.append(" " + author.name + ",")
            }
        }
    }
    
    var narrators: [Narrator]? {
        didSet {
            guard let narrators = narrators else { return }
            for narrator in narrators {
                narratorsLabel.text?.append(" " + narrator.name + ",")
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
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    let authorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "by "
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let narratorsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "with "
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(bookImageView)
        
        bookImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, width: 100, height: 100)
        
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
