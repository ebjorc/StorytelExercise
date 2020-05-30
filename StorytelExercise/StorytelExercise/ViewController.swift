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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // self.scrollView.translatesAutoresizingMaskIntoConstraints = false;
        self.view.addSubview(scrollView)
        setupScrollView()
        
        let router = Router()
        router.fetchBooks()
        
    }
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        scrollView.backgroundColor = .red
    }
    

    
    
    
    


}

