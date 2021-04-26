//
//  BookContentView.swift
//  L15Ch
//
//  Created by Jiří Šulák on 26.04.2021.
//

import SwiftUI

struct BookContentView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var page = 0
    var book: Book
    
    var body: some View {
        TabView(selection: $page) {
            ForEach(book.content.indices) {index in
                VStack {
                    Text(book.content[index])
                        .tag(index)
                    Spacer()
                    Text("\(page + 1)")
                }
            }
            .padding()
        }
        .tabViewStyle(PageTabViewStyle())
        .onChange(of: page, perform: { value in
            model.updatePage(forId: book.id, page: page)
        })
        .onAppear {
            page = book.currentPage
        }
        .navigationBarTitle(book.title)
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookContentView(book: model.books[0])
    }
}
