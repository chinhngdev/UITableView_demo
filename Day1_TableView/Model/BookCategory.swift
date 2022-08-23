//
//  BookCategory.swift
//  Day1_TableView
//
//  Created by Chinh Ng on 01/06/2022.
//

import Foundation

class BookCategory {
    var id: Int = 1
    var category: String
    var books: [Book] = []
    
    init(category: String, id: Int) {
        self.category = category
        self.id = id
        books = randomBook()
    }
    
    func randomTitle() -> String {
        let titleLength = Int.random(in: 30...300)
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var title = ""
        for _ in 0 ..< titleLength {
            title.append(letters.randomElement()!)
        }
        
        return title
    }
    
    func randomBook() -> [Book] {
        var b: [Book] = []
        for i in 0..<30 {
            b.append(Book(id: i, title: randomTitle()))
//            print("bookID: \(b[i].id), bookTitle: \(b[i].title)")
        }
        
        return b
    }
}
