//
//  BookModel.swift
//  L15Ch
//
//  Created by Jiří Šulák on 11.04.2021.
//

import Foundation


class BookModel: ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        // Get url to the json file
        let jsonUrl = Bundle.main.url(forResource: "Data", withExtension: "json")
        
        // Read the file into a data object
        do {
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the json into an array of books
            let jsonDecoder = JSONDecoder()
            let books = try jsonDecoder.decode([Book].self, from: jsonData)
            // Assign parsed books to books property
            self.books = books
            
        }
        catch {
            //log Error
            print("Coudn't load local Json data.")
        }
        
        
        
    }
    
    // Update specified book's favourite status
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    
    // Update secified book's rating
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    
    // Update specified book's page
    func updatePage(forId: Int, page: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = page
        }
    }
    
}
