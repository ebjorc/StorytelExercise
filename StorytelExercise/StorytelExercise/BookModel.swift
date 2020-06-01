//
//  BookModel.swift
//  StorytelExercise
//
//  Created by Erik Björck on 2020-05-31.
//  Copyright © 2020 Erik Björck. All rights reserved.
//

import Foundation

struct BookModelQuery: Decodable {
    let query: String
    let nextPageToken: String
    let items: [BookModel]
}

struct BookModel: Decodable {
    let id: String
    let title: String
    let authors: [String:String]
    let narrators: [String:String]
}
