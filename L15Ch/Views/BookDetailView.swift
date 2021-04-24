//
//  BookDetailView.swift
//  L15Ch
//
//  Created by Jiří Šulák on 23.04.2021.
//

import SwiftUI

struct BookDetailView: View {
    
    @State var book:Book
    
    var body: some View {
        VStack (spacing: 25){
            Text("Read Now!")
                .font(.title)
            //Navigation Link
            
            Image("cover\(book.id)")
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                
            Text("Mark for later!")
            
            Button(action: {
                checkIfRated()
            }, label: {
                if book.isFavourite == true {
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.yellow)
                }
                else {
                    Image(systemName: "star")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.yellow)
                }
            })
            
            Text("Rate \(book.title)")
            Picker("Rate", selection: $book.rating) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 300)
        }
    }
    func checkIfRated() {
        // Nefunguje - proč?
        if book.isFavourite {
            book.isFavourite = false
        }
        else {
            book.isFavourite = true
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookDetailView(book: model.books[0])
    }
}
