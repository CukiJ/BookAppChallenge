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
                LazyVStack (spacing: 40) {
                    ForEach(model.books) {book in
                        BookViewRow(book: model.books[book.id-1])
                    }
                }
                .padding(.top, 20)
            }
            .navigationBarTitle("Library overview")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(BookModel())
    }
}
