//
//  Model.swift
//  ExampleOfMVC
//
//  Created by Faiq Khan on 02/05/2021.

import Foundation

// MARK: - Book Collection
struct BookCollection: Codable {
    let status: String
    let code, total: Int
    let data: [Books]
}

// MARK: - Books
struct Books: Codable {
    let title, author, genre, description: String
    let isbn: String
    let image: String
    let published, publisher: String

    enum CodingKeys: String, CodingKey {
        case title, author, genre
        case description
        case isbn, image, published, publisher
    }
}


//  [  EXAMPLE OF RESPONSE - COURSTESY OF https://fakerapi.it/api/v1/books?_quantity=20  ]
//{
//    "status": "OK",
//    "code": 200,
//    "total": 2,
//    "data": [
//        {
//            "title": "Majesty,' said.",
//            "author": "Grady Ledner",
//            "genre": "Iusto",
//            "description": "VERY nearly at the stick, running a very grave voice, 'until all the while, till at last it unfolded its arms, took the hookah into its eyes by this time.) 'You're nothing but a pack of cards: the.",
//            "isbn": "9798295751417",
//            "image": "http://placeimg.com/480/640/any",
//            "published": "1975-07-18",
//            "publisher": "Voluptate Repellendus"
//        },
//        {
//            "title": "Though they were.",
//            "author": "Aileen Thiel",
//            "genre": "Quia",
//            "description": "King. Here one of them with one of them were animals, and some were birds,) 'I suppose so,' said the Duchess, 'and that's why. Pig!' She said the Queen. 'Their heads are gone, if it had grown in the.",
//            "isbn": "9793663194711",
//            "image": "http://placeimg.com/480/640/any",
//            "published": "2009-02-09",
//            "publisher": "Possimus Numquam"
//        }
//    ]
//}
