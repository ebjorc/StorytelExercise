//
//  Router.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-05-30.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import Foundation

class Router {
    let apiURL = "https://api.storytel.net/search?query=harry&page=10"
    
    func fetchBooks(){
        if let url = URL(string: apiURL){
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print(jsonString)
                    }
                }
            }.resume()
        }
    }
}


