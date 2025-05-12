//
//  MoviesApi.swift
//  movies
//
//  Created by Macos on 05/05/2025.
//

import Foundation

class MoviesApi : Codable{
    let Title: String?
    let Year: String?
    let Rated: String?
    let Genre: String?
    let Poster:String?
    
    
    init(Title: String?, Year: String?, Rated: String?, Genre: String?, Poster: String?) {
        self.Title = Title
        self.Year = Year
        self.Rated = Rated
        self.Genre = Genre
        self.Poster = Poster
    }
        
}



