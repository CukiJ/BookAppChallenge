//
//  BookViewRow.swift
//  L15Ch
//
//  Created by Jiří Šulák on 11.04.2021.
//

import SwiftUI

struct BookViewRow: View {
    
    @State var book:Book
    
    var body: some View {
        
        ZStack (alignment: .center){
            Rectangle()
                .frame(width: 350, height: 500, alignment: .center)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 20)
            
            VStack (alignment: .leading){
                Text(book.title)
                    .font(.title)
                    .bold()
                    .padding(5)
                Text(book.author)
                    .italic()
                    .font(.body)
                    .padding(.horizontal, 10)
                NavigationLink(
                    destination: BookDetailView(book: book),
                    label: {
                        Image("cover" + String(book.id))
                            .resizable()
                            .scaledToFit()
                            .padding([.horizontal,.bottom], 10)
                            .frame(width: 320, height: 380)
                    })
            }
            .frame(width: 350, height: 500, alignment: .center)
        }
        
    }
}

struct BookViewRow_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        BookViewRow(book: model.books[0])
    }
}
