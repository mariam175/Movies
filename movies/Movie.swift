//
//  Movie.swift
//  movies
//
//  Created by Macos on 30/04/2025.
//

import Foundation

class Movie{
    var id:Int
    var title:String
    var image : String
    var rating : Float
    var releaseYear : Int
    var genre : String
    
    init(id:Int, title: String, image: String, rating: Float, releaseYear: Int, genre: String) {
        self.id = id
        self.title = title
        self.image = image
        self.rating = rating
        self.releaseYear = releaseYear
        self.genre = genre
        print(self.id)
    }
}
