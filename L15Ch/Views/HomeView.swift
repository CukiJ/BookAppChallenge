//
//  ContentView.swift
//  L15Ch
//
//  Created by Jiří Šulák on 11.04.2021.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model: BookModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(model.books) {book in
                        BookViewRow(id: book.id, title: book.author, author: book.author, isFavourite: book.isFavourite, currentPage: book.currentPage, rating: book.rating, content: book.content)
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
