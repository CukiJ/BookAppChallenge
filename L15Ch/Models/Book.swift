//
//  Book.swift
//  L15Ch
//
//  Created by Jiří Šulák on 11.04.2021.
//

import Foundation


struct Book: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var author: String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    var content: [String]
    
}
