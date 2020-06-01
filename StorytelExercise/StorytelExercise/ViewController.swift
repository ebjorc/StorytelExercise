//
//  ViewController.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-05-30.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let queryImageView = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(scrollView)
        setupScrollView()
        
        scrollView.addSubview(queryImageView)
        setupImageView()
        
        let router = Router()
//        router.fetchBooks { (res) in
//            switch res {
//            case .success(let bookModelQuery):
//                print(bookModelQuery)
//            case .failure(let err):
//                print("Error:", err)
//            }
//        }
        
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 1000).isActive = true
        scrollView.backgroundColor = .red
    }
    
    func setupImageView() {
        queryImageView.translatesAutoresizingMaskIntoConstraints = false
        queryImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        queryImageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        queryImageView.heightAnchor.constraint(equalTo: queryImageView.widthAnchor).isActive = true
        queryImageView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        queryImageView.backgroundColor = .blue
        
    }
    

    
    
    
    


}

