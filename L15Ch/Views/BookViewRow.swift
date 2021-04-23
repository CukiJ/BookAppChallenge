//
//  BookViewRow.swift
//  L15Ch
//
//  Created by Jiří Šulák on 11.04.2021.
//

import SwiftUI

struct BookViewRow: View {
    
    var id: Int
    var title: String
    var author: String
    var isFavourite: Bool
    var currentPage: Int
    var rating: Int
    var content: [String]
    
    var body: some View {
        
        ZStack (alignment: .center){
            Rectangle()
                .frame(width: 350, height: 500, alignment: .center)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 20)
            
            VStack {
                Text(title)
                Text(author)
                Image("cover" + String(id))
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .frame(width: 350, height: 500, alignment: .center)
        }
        
    }
}

struct BookViewRow_Previews: PreviewProvider {
    static var previews: some View {
        BookViewRow(id: 1, title: "Test název", author: "Já", isFavourite: false, currentPage: 1, rating: 3, content:["Strana 1","Strana 2"])
    }
}
