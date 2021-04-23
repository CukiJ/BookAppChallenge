//
//  BookDetailView.swift
//  L15Ch
//
//  Created by Jiří Šulák on 23.04.2021.
//

import SwiftUI

struct BookDetailView: View {
    var title:String
    var image:String
    @State var isFavourite: Bool
    @State var rating: Int
    @State var star:String
    
    var body: some View {
        VStack (spacing: 25){
            Text("Read Now!")
                .font(.title)
            //Button
            
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 200)
                
            Text("Mark for later!")
            
            Button(action: {
                checkIfRated()
            }, label: {
                Image(systemName: "\(star)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30)
                    .foregroundColor(.yellow)
            })
            
            Text("Rate \(title)")
            Picker("", selection: $rating) {
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
        if isFavourite {
            star = "star"
            isFavourite = false
        }
        else {
            star = "star.fill"
            isFavourite = true
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(title: "Test", image: "cover2", isFavourite: false, rating: 3, star: "star")
    }
}
