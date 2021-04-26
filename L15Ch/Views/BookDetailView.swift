//
//  BookDetailView.swift
//  L15Ch
//
//  Created by Jiří Šulák on 23.04.2021.
//

import SwiftUI

struct BookDetailView: View {
    
    @EnvironmentObject var model: BookModel
    @State private var rating = 2
    var book: Book
    
    var body: some View {
        VStack (spacing: 25){
            Text("Read Now!")
                .font(.title)
            NavigationLink(
                destination: BookContentView(book: book),
                label: {
                    Image("cover\(book.id)")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                })
            
            Text("Mark for later!")
            
            Button(action: {
                model.updateFavourite(forId: book.id)
            }) {Image(systemName: book.isFavourite ? "star.fill" : "star")
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundColor(.yellow)
            }
                
            
            Text("Rate \(book.title)")
            Picker("Rate", selection: $rating) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 300)
            .onChange(of: rating, perform: { value in
                model.updateRating(forId: book.id, rating: rating)
            })
        }
        .onAppear {rating = book.rating}
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookDetailView(book: model.books[0])
    }
}
