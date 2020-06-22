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
    let nextPageToken: String?
    let items: [BookModel]
}

struct BookModel: Decodable {
    let title: String
    let authors: [Author]
    let narrators: [Narrator]
    let cover: CoverImage
}

struct Author: Decodable {
    let id: String
    let name: String
}

struct Narrator: Decodable {
    let id: String
    let name: String
}

struct CoverImage: Decodable {
    let url: String
    let width: Int
    let height: Int
}

