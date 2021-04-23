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
}
