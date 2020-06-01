//
//  Router.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-05-30.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import Foundation

let apiURL = "https://api.storytel.net/search?query=harry&page=10"

class Router {
    
    func fetchBooks(completion: @escaping (Result<BookModelQuery, Error>) -> ()){
        if let url = URL(string: apiURL){
            URLSession.shared.dataTask(with: url) {data, response, err in
                if let err = err{
                    completion(.failure(err))
                    // return
                }
                if let data = data {
                    do {
                        let bookModelQuery = try JSONDecoder().decode(BookModelQuery.self, from: data)
                        completion(.success(bookModelQuery))
                    }
                    catch let jsonErr {
                        completion(.failure(jsonErr))
                    }
                }
            }.resume()
        }
    }
}


